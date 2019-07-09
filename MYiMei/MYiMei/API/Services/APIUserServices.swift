//
//  APIUserServices.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

protocol APIUserServicesProtocol {
    //登录协议
    func login(phoneNumber: String, password: String, _ success: @escaping(((APILoginResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

    //退出登录协议
    func logout(userId: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

    //获取登录验证码
    func getLoginMsg(phoneNumber:String,_ success: @escaping(((APIListModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    //上传图片专用
    func uploadPic(ext:String,type:String,size:Int,image:String,_ success: @escaping(((UploadFileResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

}

class APIUserServices: APIUserServicesProtocol {
    func uploadPic(ext: String, type: String, size: Int, image: String, _ success: @escaping (((UploadFileResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "ext":ext,
            "type":type,
            "size":size,
            "image":image,
            "is_debug":"1"
        ]
        APIService.shared.request(.uploadPic(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(UploadFileResponeModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }



    func getLoginMsg(phoneNumber: String, _ success: @escaping (((APIListModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "username":phoneNumber,
            "is_debug":"1"
        ]
        APIService.shared.request(.getLoginMsg(user: params), { (data) in
            do {
                let model = try JSONDecoder().decode(APIListModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }

    }

    //登录实现
    func login(phoneNumber: String, password: String, _ success: @escaping (((APILoginResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "username":phoneNumber,
            "password":password,
            "is_debug":"1"
        ]
        APIService.shared.request(.login(user: params), { (data) in
            do {
                let model = try JSONDecoder().decode(APILoginResponseModel.self, from: data)
                if let token = model.data?.mch_info?.access_token {
                    saveToken(token: token)
                    APIUser.shared.user = model.data?.mch_info
                    APIUser.shared.saveUserToCache()
                }
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }

    //退出登录实现
    func logout(userId: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {

    }


}
