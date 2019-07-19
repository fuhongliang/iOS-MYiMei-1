//
//  OrderListResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/10.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:订单列表返回的Json数据
class OrderListResponseModel: Codable {
    
    var code : Int!
    var data : OrderList!
    var msg : String!
    
}

//MARK:返回的订单列表
class OrderList: Codable{
    
    var order : [Order]!
    
}

// MARK:返回订单对象
class Order : Codable{
    
    var address : String!
    var addtime : Int!
    var before_update_price : String!//修改前实际支付费用
    var order_status : Int!//订单状态
    var confirm_time : Int!
    var coupon_sub_price : String!
    var express : String!
    var express_no : String!
    var express_price : String!
    var goodsList : [GoodsList]!
    var is_confirm : Int!
    var is_delete : Int!
    var is_pay : Int!
    var is_send : Int!
    var mobile : String!
    var name : String!
    var order_id : Int!
    var order_no : String!
    var pay_price : String!
    var pay_time : Int!
    var pay_type : Int!
    var remark : String!
    var seller_comments : String?//商家备注
    var send_time : Int!
    var total_price : String!
    
}

//MARK:订单中商品详情
class GoodsList : Codable{
    var attr : [Attr]!
    var name : String!
    var pic : String!
    var total_price : String!
    var num = Int()
}

//MARK:商品的商品规格
class Attr : Codable{
    var attr_group_name : String!
    var attr_id : Int!
    var attr_name : String!
    var no : String!
}
