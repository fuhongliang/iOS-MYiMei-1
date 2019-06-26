//
//  APIServices.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import MBProgressHUD

fileprivate let ssl: Bool = true
fileprivate let baseHttpsUrl: String = "https://testjiajuapi.ifhu.cn"
fileprivate let baseHttpUrl: String = "http://testjiajuapi.ifhu.cn"

// MARK: 网络请求加载插件
let loadingPlugin = NetworkActivityPlugin { (type, target) in
    guard let vc = topVC else { return }
    switch type {
    case .began:
        MBProgressHUD.hide(for: vc.view, animated: false)
        MBProgressHUD.showAdded(to: vc.view, animated: true)
    case .ended:
        MBProgressHUD.hide(for: vc.view, animated: true)
    }
}

//MARK: 超时插件
let TimeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<NetApi>.RequestResultClosure) -> Void in

    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

//MARK: 接口函数
enum NetApi {
    case login(user: [String:String])
    case getLoginMsg(user: [String:String])
    case logout(userId: String)
    case getCategory(param: [String:String])
    case getGoodsList(param: [String:String])
}

//MARK: 请求对象的封装
extension NetApi: TargetType {
    var baseURL: URL {
        if ssl {
            return URL(string: baseHttpsUrl)!
        }
        else {
            return URL(string: baseHttpUrl)!
        }
    }

    var path: String {
        switch self {
        case .login:
            return "/login"
        case .getLoginMsg:
            return "/get_captcha_login"
        case .logout(let userId):
            return "/tokens/" + userId + "/"
        case .getCategory:
            return "/list_cats"
        case .getGoodsList:
            return "/list_goods"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login,.logout,.getCategory,.getLoginMsg,.getGoodsList:
            return .post
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getLoginMsg(let user):
            return .requestParameters(parameters: user, encoding: JSONEncoding.default)
        case .login(let user):
            return .requestParameters(parameters: user, encoding: JSONEncoding.default)
        case .getCategory(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .logout(let userId):
            return .requestParameters(parameters: ["userid":userId], encoding: JSONEncoding.default)
        case .getGoodsList(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
       }
    }

    var headers: [String : String]? {
        var dict: [String:String] = [
            "Content-Type":"application/json"
        ]
        switch self {
        case .logout:
            let token: String = getToken() // 本地token
            dict["Authorization"] = token
        default:
            break
        }
        return dict
    }
}

class APIService {

    private init(needMBProgressHUD:Bool) {
        let APIProvider = MoyaProvider<NetApi>(plugins: [loadingPlugin])
        apiProvider = APIProvider
    }

    public static let shared: APIService = APIService(needMBProgressHUD: true)

    public static let sharedBackground: APIService = APIService(needMBProgressHUD: false)

    private var manager: SessionManager?

    fileprivate(set) var apiProvider: MoyaProvider<NetApi>!

    func request(_ target: NetApi, _ success: @escaping ((Data) -> ()), _ fail: @escaping ((APIErrorModel) -> ())) {
        apiProvider.request(target) { (result) in
            print("--------接口响应----------------")
            switch result {
            case let .success(moyaResponse):
                do {
                    let anyData = try moyaResponse.mapJSON()
                    let data =  moyaResponse.data
                    let statusCode =  moyaResponse.statusCode
                    print("\(data) --- \(statusCode) ----- \(anyData)")
                    if statusCode == 200 {
                        if let mapData: [String:Any] = anyData as? [String:Any] {
                            if mapData.keys.contains("code") {
                                if let code = mapData["code"] as? Int {
                                    if code == 0 {
                                        success(data)
                                    }else if code == 10000 {//token过期
                                        (UIApplication.shared.delegate as! AppDelegate).showLoginView()
                                    }
                                    else {
                                        let msg: String = mapData["msg"] as? String ?? "Error message"
                                        let errorModel = APIErrorModel.getErrorModel(_code: code, _msg: msg, _data: nil)
                                        fail(errorModel)
                                    }
                                }
                                else {
                                    let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: "Data not contain code", _data: nil)
                                    fail(errorModel)
                                }
                            }else {
                                let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: "Data not contain code", _data: nil)
                                fail(errorModel)
                            }
                        }
                        else {
                            let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: String(moyaResponse.description), _data: nil)
                            fail(errorModel)
                        }
                    }else if statusCode == 401 {//token过期
//                        (UIApplication.shared.delegate as! AppDelegate).showLoginView()
                    }else {
                        if let mapData: [String:Any] = anyData as? [String:Any] {
                            if mapData.keys.contains("msg") {
                                if let message = mapData["msg"] as? String {
                                    let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: message, _data: nil)
                                    fail(errorModel)
                                }
                            }

                        }else{
                            let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: String(moyaResponse.description), _data: nil)
                            fail(errorModel)
                        }
                    }

                } catch {
                    print(error.localizedDescription)
                    let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: nil, _data: error.localizedDescription)
                    fail(errorModel)
                }

            case let .failure(error):
                print(error.localizedDescription)
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: nil, _data: error.failureReason)
                fail(errorModel)
            }
            print("----------响应结束--------------")
        }
    }
}
