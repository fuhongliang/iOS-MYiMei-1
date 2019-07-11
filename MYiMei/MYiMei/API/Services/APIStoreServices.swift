//
//  APIStoreServices.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation
protocol APIStoreServicesProtocol {

    //获取商铺经营数据
    func getStoreOperateData(_ success: @escaping(((StoreDashBoardModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

    //MARK:获取商铺保证金
    func getStoreDepostData(_ success: @escaping(((StoreDepostReponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

}

class APIStoreServices: APIStoreServicesProtocol {
    func getStoreDepostData(_ success: @escaping (((StoreDepostReponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1"]
        APIService.sharedBackground.request(.getStoreDepostData(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(StoreDepostReponseModel.self, from: data)
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

    func getStoreOperateData(_ success: @escaping (((StoreDashBoardModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1"]
            APIService.sharedBackground.request(.getStoreOperateData(param: params), { (data) in
                do {
                    let model = try JSONDecoder().decode(StoreDashBoardModel.self, from: data)
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
}
