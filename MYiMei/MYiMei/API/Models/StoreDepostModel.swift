//
//  StoreDepostModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

class StoreDepostReponseModel: Codable {

    var code: Int?

    var msg: String?

    var data: StoreDepostDataModel?

}


class StoreDepostDataModel: Codable {
    var pass: [PassModel]?
    var review: [ReviewModel]?
}


class PassModel: Codable {

    var mch_id = Int()

    var price = String()

    var image_url = String()

    var store_id = Int()

    var status = String()

}


class ReviewModel: Codable {


    var mch_id = Int()

    var price = String()

    var image_url = String()

    var store_id = Int()

    var status = String()

}
