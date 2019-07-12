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
    
    //MARK:修改订单价格
    func modifyOrderPrice(orderId: Int, updatePrice: Int, updateExpress:Int, type: Int,_ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:发货接口
    func deliveryGoods(order_id: Int,is_express: Int,express: String,express_no: String, words: String,_ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
}

class APIOrderServices: APIOrderServicesProtocol {
    func deliveryGoods(order_id: Int, is_express: Int, express: String, express_no: String, words: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id": APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "order_id": order_id, //订单ID
            "is_express":is_express, //无需物流0 或 物流配送1
            "express": express, //物流公司
            "express_no": express_no, //物流单号
            "words": words, //商家留言
            "is_debug":"1"
        ]
        APIService.shared.request(.deliveryGoods(param: params), { (Data) in
            //提示是否成功
            success()
        }) { (APIErrorModel) in
            fail(APIErrorModel)
        }
    }
    
    
    func getOrderList(status: Int ,page: Int ,_ success: @escaping (((OrderListResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id": APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "status": status,
            "page": page,
            "per_page": 20,
            "is_debug":"1"
        ]
        APIService.sharedBackground.request(.getOrderList(param: params), { (data) in
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
    
    func modifyOrderPrice(orderId: Int, updatePrice: Int, updateExpress: Int, type: Int, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id": APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "order_id": orderId,
            "update_price": updatePrice,
            "update_express": updateExpress,
            "type": type,
            "is_debug":"1"
        ]
        APIService.shared.request(.modifyOrderPrice(param: params), { (data) in
            success()
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

