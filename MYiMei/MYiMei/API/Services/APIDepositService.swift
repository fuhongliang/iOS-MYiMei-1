//
//  APIDepositService.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/10.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

protocol APIDepositServicesProtocol {

    //MARK:获取保证金协议URL
    func getDepositAgreement(mch_id: Int,cat_id: Int, access_token: String, _ success: @escaping(((GoodsResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
   
}

class APIDepositServices: APIDepositServicesProtocol {
 
    //MARK:获取保证金协议URL
    func getDepositAgreement(mch_id: Int, cat_id: Int, access_token: String, _ success: @escaping (((GoodsResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(mch_id),
            "cat_id":String(cat_id),
            "access_token":access_token,
            "is_debug":"1"
        ]
        
        APIService.shared.request(.getGoodsList(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(GoodsResponeModel.self, from: data)
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

