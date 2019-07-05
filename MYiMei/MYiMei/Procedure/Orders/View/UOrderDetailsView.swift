//
//  UOrderDetailsView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/4.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOrderDetailsView: BaseView {
    
    //字段说明
    var orderStatusLaber = UILabel()
    var orderDetailsLaber = UILabel()
    var userNameLaber = UILabel()
    var userPhoneLaber = UILabel()
    var addressLaber = UILabel()
    var orderNumberLeftLaber = UILabel()
    var orderNumberRightLaber = UILabel()
    var orderTimeLeftLaber = UILabel()
    var orderTimeRighrLaber = UILabel()
    var payModeLeftLaber = UILabel()
    var payModeRightLaber = UILabel()
    var freightLeftLaber = UILabel()
    var freightRightLaber = UILabel()
    var orderAmountLeftLaber = UILabel()
    var orderAmountRightLaber = UILabel()
    var bgModifypPriceLeftLaber = UILabel()
    var bgModifypPriceRightLaber = UILabel()
    //背景
    var headBg = UIImageView()
    var orderStatusBg = UIImageView()
    var orderDetailsBg = UIImageView()
    //分割线
    var orderDetailsLine = UILabel()
    var userLine = UILabel()
    var payLine = UILabel()
    //图标
    var receiptIcon = UIImageView()
    var addressIcon = UIImageView()
    
    
    func setView()  {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        //MARK:头部背景
        headBg.image = UIImage.init(named: "order_deatails_bg")
        self.addSubview(headBg)
        headBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(160)
        }
        //MARK:订单状态
        orderStatusLaber.text = "订单已经提交，等待买家付款"
        orderStatusLaber.textColor = UIColor.white
        orderStatusLaber.font = UIFont.boldSystemFont(ofSize: 24)
        self.addSubview(orderStatusLaber)
        orderStatusLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(headBg.snp.top).offset(19)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //MARK:订单状态背景
        orderStatusBg.backgroundColor = UIColor.white
        orderStatusBg.layer.cornerRadius = 4
        self.addSubview(orderStatusBg)
        orderStatusBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(113)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(orderStatusLaber.snp.bottom).offset(15)
        }
        //MARK:订单详情背景
        orderDetailsBg.backgroundColor = UIColor.white
        orderDetailsBg.layer.cornerRadius = 4
        self.addSubview(orderDetailsBg)
        orderDetailsBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(308)
            ConstraintMaker.top.equalTo(orderStatusBg.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        //MARK:订单详情
        orderDetailsLaber.text = "订单详情"
        orderDetailsLaber.textColor = UIColor.black
        orderDetailsLaber.font = UIFont.boldSystemFont(ofSize: 18)
        self.addSubview(orderDetailsLaber)
        orderDetailsLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderDetailsBg.snp.top).offset(13)
            ConstraintMaker.left.equalToSuperview().offset(30)
        }
        //MARK:分割线
        orderDetailsLine.backgroundColor = UIColor.hex(hexString: "#F2f2F2")
        self.addSubview(orderDetailsLine)
        orderDetailsLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderDetailsLaber.snp.bottom).offset(12)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:收货图标
        receiptIcon.image = UIImage.init(named: "receipt")
        self.addSubview(receiptIcon)
        receiptIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(13)
            ConstraintMaker.top.equalTo(orderDetailsLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(30)
        }
        //MARK:用户名称
        userNameLaber.text = "张先生"
        userNameLaber.textColor = UIColor.black
        userNameLaber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(userNameLaber)
        userNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderDetailsLine.snp.bottom).offset(13)
            ConstraintMaker.left.equalTo(receiptIcon.snp.right).offset(8)
        }
        //MARK:用户电话号码
        userPhoneLaber.text = "15743984389"
        userPhoneLaber.textColor = UIColor.hex(hexString: "#1C98F6")
        userPhoneLaber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(userPhoneLaber)
        userPhoneLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderDetailsLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalTo(userNameLaber.snp.right).offset(24)
        }
        //MARK:地址图标
        addressIcon.image = UIImage.init(named: "address")
        self.addSubview(addressIcon)
        addressIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(receiptIcon.snp.bottom).offset(15)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.width.equalTo(10)
            ConstraintMaker.left.equalTo(orderDetailsBg.snp.left).offset(15)
        }
        //MARK:地址
        addressLaber.text = "地址: 广东省深圳市南山区松柏783号"
        addressLaber.textColor = UIColor.hex(hexString: "#999999")
        addressLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(addressLaber)
        addressLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(addressIcon.snp.right).offset(10)
            ConstraintMaker.top.equalTo(userNameLaber.snp.bottom).offset(10)
        }
        //MARK:分割线
        userLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(userLine)
        userLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(addressIcon.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(30)
            ConstraintMaker.right.equalToSuperview().offset(-30)
        }
        //MARK:订单编号
        orderNumberLeftLaber.text = "订单编号"
        orderNumberLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        orderNumberLeftLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderNumberLeftLaber)
        orderNumberLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(userLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(30)
        }
        orderNumberRightLaber.text = "263768434897589359"
        orderNumberRightLaber.textColor = UIColor.hex(hexString: "#333333")
        orderNumberRightLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderNumberRightLaber)
        orderNumberRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(userLine.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-30)
        }
        //MARK:订单时间
        orderTimeLeftLaber.text = "订单时间"
        orderTimeLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        orderTimeLeftLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderTimeLeftLaber)
        orderTimeLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderNumberLeftLaber.snp.bottom).offset(10)
            ConstraintMaker.left.equalToSuperview().offset(30)
        }
        orderTimeRighrLaber.text = "2019-06-18 15:36:56"
        orderTimeRighrLaber.textColor = UIColor.hex(hexString: "#333333")
        orderTimeRighrLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderTimeRighrLaber)
        orderTimeRighrLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderNumberRightLaber.snp.bottom).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-30)
        }
        //MARK:支付方式
        payModeLeftLaber.text = "支付方式"
        payModeLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        payModeLeftLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(payModeLeftLaber)
        payModeLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderTimeLeftLaber.snp.bottom).offset(10)
            ConstraintMaker.left.equalToSuperview().offset(30)
        }
        payModeRightLaber.text = "暂无"
        payModeRightLaber.textColor = UIColor.hex(hexString: "#333333")
        payModeRightLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(payModeRightLaber)
        payModeRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderTimeRighrLaber.snp.bottom).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-30)
        }
        //MARK:分割线
        payLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(payLine)
        payLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(payModeLeftLaber.snp.bottom).offset(14)
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(30)
            ConstraintMaker.right.equalToSuperview().offset(-30)
        }
        //MARK:运费
        freightLeftLaber.text = "运费"
        freightLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        freightLeftLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(freightLeftLaber)
        freightLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(payLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(30)
        }
        freightRightLaber.text = "0.00元"
        freightRightLaber.textColor = UIColor.hex(hexString: "#333333")
        freightRightLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(freightRightLaber)
        freightRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(payLine.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-30)
        }
        //MARK:下单金额
        orderAmountLeftLaber.text = "下单金额"
        orderAmountLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        orderAmountLeftLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderAmountLeftLaber)
        orderAmountLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(freightLeftLaber.snp.bottom).offset(10)
            ConstraintMaker.left.equalToSuperview().offset(30)
        }
        orderAmountRightLaber.text = "7860.00元"
        orderAmountRightLaber.textColor = UIColor.hex(hexString: "#333333")
        orderAmountRightLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderAmountRightLaber)
        orderAmountRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(freightRightLaber.snp.bottom).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-30)
        }
        //MARK:后台改价
        bgModifypPriceLeftLaber.text = "后台改价"
        bgModifypPriceLeftLaber.textColor = UIColor.hex(hexString: "#999999")
        bgModifypPriceLeftLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(bgModifypPriceLeftLaber)
        bgModifypPriceLeftLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderAmountLeftLaber.snp.bottom).offset(10)
            ConstraintMaker.left.equalToSuperview().offset(30)
        }
        bgModifypPriceRightLaber.text = "优惠: 1元"
        bgModifypPriceRightLaber.textColor = UIColor.hex(hexString: "#333333")
        bgModifypPriceRightLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(bgModifypPriceRightLaber)
        bgModifypPriceRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderAmountRightLaber.snp.bottom).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-30)
        }
        
    }
}
