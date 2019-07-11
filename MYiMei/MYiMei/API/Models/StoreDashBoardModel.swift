//
//  StoreDashBoardModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

class StoreDashBoardModel: Codable {

    var code: Int?

    var msg: String?

    var data: StoreDashBoardResponeDataModel?

}


class StoreDashBoardResponeDataModel: Codable {
    var store: DashBoardModel?
}


class DashBoardModel: Codable {

    var order_num_day = Int()

    var order_num_thirty = Int()

    var total_goods_count = Int()

    var total_order_count = Int()

    var total_income_day = String()

    var total_income_thirty = String()

    var operate_data_url:String?

    var contact_platform_tel: String?

}
