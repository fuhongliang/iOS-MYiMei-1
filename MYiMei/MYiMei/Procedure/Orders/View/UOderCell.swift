//
//  UOderCell.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/3.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOderCell : BaseView {
    
    //字段
    var statusLeber = UILabel()
    var userNameLeber = UILabel()
    var userPhoneLeber = UILabel()
    var addressLeber = UILabel()
    var commodityLeber = UILabel()
    var commodityNameLeber = UILabel()
    var commoditySpecificationLeber = UILabel()
    var commoditypriceLeber = UILabel()
    //背景
    var whiteBg = UIImageView()
    //图标
    var receiptIcon = UIImageView()
    var userPhoneIcon = UIImageView()
    var addressIcon = UIImageView()
    var commodityIcon = UIImageView()
    //分割线
    var userLine = UIImageView()
    
    
    func setView()  {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        //待处理
        statusLeber.text = "待处理"
        statusLeber.textColor = UIColor.hex(hexString: "#FF4444")
        statusLeber.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(statusLeber)
        statusLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //白色背景
        whiteBg.backgroundColor = UIColor.white
        self.addSubview(whiteBg)
        whiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(429)
            ConstraintMaker.top.equalToSuperview().offset(44)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
        }
        //收货图标
        receiptIcon.image = UIImage.init(named: "receipt")
        self.addSubview(receiptIcon)
        receiptIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(13)
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(18)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //用户名称
        userNameLeber.text = "张先生"
        userNameLeber.textColor = UIColor.black
        userNameLeber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(userNameLeber)
        userNameLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(15)
            ConstraintMaker.left.equalTo(receiptIcon.snp.right).offset(8)
        }
        //用户电话号码
        userPhoneLeber.text = "15743984389"
        userPhoneLeber.textColor = UIColor.hex(hexString: "#1C98F6")
        userPhoneLeber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(userPhoneLeber)
        userPhoneLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(16)
            ConstraintMaker.left.equalTo(userNameLeber.snp.right).offset(24)
        }
        //拨打用户电话图标
        userPhoneIcon.image = UIImage.init(named: "phone")
        self.addSubview(userPhoneIcon)
        userPhoneIcon.snp.makeConstraints { (ConstraintMaker) in
           ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
            ConstraintMaker.size.equalTo(17)
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(15)
        }
        //地址图标
        addressIcon.image = UIImage.init(named: "address")
        self.addSubview(addressIcon)
        addressIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(receiptIcon.snp.bottom).offset(15)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.width.equalTo(10)
            ConstraintMaker.left.equalTo(whiteBg.snp.left).offset(15)
        }
        //地址
        addressLeber.text = "地址: 广东省深圳市南山区松柏783号"
        addressLeber.textColor = UIColor.hex(hexString: "#999999")
        addressLeber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(addressLeber)
        addressLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(addressIcon.snp.right).offset(10)
            ConstraintMaker.top.equalTo(userPhoneLeber.snp.bottom).offset(10)
        }
        //分割线
        userLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(userLine)
        userLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(addressIcon.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
        //商品
        commodityLeber.text = "商品"
        commodityLeber.textColor = UIColor.black
        commodityLeber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(commodityLeber)
        commodityLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(userLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
        
        //商品图片
        commodityIcon.image = UIImage.init(named: "apply_status")
        self.addSubview(commodityIcon)
        commodityIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(61)
            ConstraintMaker.top.equalTo(commodityLeber.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //商品名称
        commodityNameLeber.text = "商品名称名称名称"
        commodityNameLeber.textColor = UIColor.black
        commodityNameLeber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(commodityNameLeber)
        commodityNameLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityLeber.snp.bottom).offset(15)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        
        //商品规格
        commoditySpecificationLeber.text = "规格: 默认"
        commoditySpecificationLeber.textColor = UIColor.hex(hexString: "#999999")
        commoditySpecificationLeber.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(commoditySpecificationLeber)
        commoditySpecificationLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityNameLeber.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        //商品价格
        commoditypriceLeber.text = "￥43843.00"
        commoditypriceLeber.textColor = UIColor.black
        commoditypriceLeber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(commoditypriceLeber)
        commoditypriceLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commoditySpecificationLeber.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
    }
    
}
