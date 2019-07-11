//
//  APIOrderServices.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/10.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

protocol APIOrderServicesProtocol {
    
    //MARK:获取订单列表
    func getOrderList(status: Int ,page: Int ,_ success: @escaping(((OrderListResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
}

class APIOrderServices: APIOrderServicesProtocol {
    
    func getOrderList(status: Int ,page: Int ,_ success: @escaping (((OrderListResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id": APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "status": status,
            "page": page,
            "per_page": 20,
            "is_debug":"1"
        ]
        APIService.shared.request(.getOrderList(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(OrderListResponseModel.self, from: data)
                success(model)
            } catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }
    
    
    
    
    //MARK:获取订单列表
//    func getDepositAgreement(_ success: @escaping (((OrderListResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
//        let params: [String:Any] = [
//            "mch_id": APIUser.shared.user?.mch_id as Any,
//            "store_id":APIUser.shared.user?.store_id as Any,
//            "access_token":APIUser.shared.user?.access_token as Any,
//            "is_debug":"1"
//        ]
    
//        APIService.shared.request(.getDepositAgreement(param: params), { (data) in
//            do {
//                let model = try JSONDecoder().decode(DepositAgreementResponsModel.self, from: data)
//                success(model)
//            }
//            catch {
//                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
//                fail(errorModel)
//            }
//        }) { (error) in
//            fail(error)
//        }
//    }
    
}

