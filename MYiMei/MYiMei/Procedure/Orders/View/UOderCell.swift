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
    var statusLaber = UILabel()
    var userNameLaber = UILabel()
    var userPhoneLaber = UILabel()
    var addressLaber = UILabel()
    var commodityLaber = UILabel()
    var commodityNameLaber = UILabel()
    var commoditySpecificationLaber = UILabel()
    var commodityPriceLaber = UILabel()
    var expandLaber = UILabel()
    var commodityNumberLaber = UILabel()
    var orderNumberLabel = UILabel()
    var orderTimeLaber = UILabel()
    var leaveCommentsLaber = UILabel()
    var leaveCommentsRightLaber = UILabel()
    var freightLaber = UILabel()
    var freightPriceLaber = UILabel()
    var totalLaber = UILabel()
    var totalPriceLaber = UILabel()
    
    //背景
    var whiteBg = UIImageView()
    //图标
    var receiptIcon = UIImageView()
    var userPhoneIcon = UIImageView()
    var addressIcon = UIImageView()
    var commodityIcon = UIImageView()
    var expandIcon = UIImageView()
    //分割线
    var userLine = UIImageView()
    var commodityLine = UIImageView()
    var leaveCommentsTopLine = UIImageView()
    var leaveCommentsBottomLine = UIImageView()
    var totalLine = UIImageView()
    //按钮
    var priceModifyBg = UIButton()
    
    func setView()  {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        //待处理
        statusLaber.text = "待处理"
        statusLaber.textColor = UIColor.hex(hexString: "#FF4444")
        statusLaber.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(statusLaber)
        statusLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //白色背景
        whiteBg.backgroundColor = UIColor.white
        self.addSubview(whiteBg)
        whiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(475)
            ConstraintMaker.top.equalToSuperview().offset(44)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
        }
        //收货图标
        receiptIcon.image = UIImage.init(named: "receipt")
        self.addSubview(receiptIcon)
        receiptIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(13)
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(17)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //用户名称
        userNameLaber.text = "张先生"
        userNameLaber.textColor = UIColor.black
        userNameLaber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(userNameLaber)
        userNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(15)
            ConstraintMaker.left.equalTo(receiptIcon.snp.right).offset(8)
        }
        //用户电话号码
        userPhoneLaber.text = "15743984389"
        userPhoneLaber.textColor = UIColor.hex(hexString: "#1C98F6")
        userPhoneLaber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(userPhoneLaber)
        userPhoneLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(16)
            ConstraintMaker.left.equalTo(userNameLaber.snp.right).offset(24)
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
        addressLaber.text = "地址: 广东省深圳市南山区松柏783号"
        addressLaber.textColor = UIColor.hex(hexString: "#999999")
        addressLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(addressLaber)
        addressLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(addressIcon.snp.right).offset(10)
            ConstraintMaker.top.equalTo(userPhoneLaber.snp.bottom).offset(10)
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
        commodityLaber.text = "商品"
        commodityLaber.textColor = UIColor.black
        commodityLaber.font = UIFont.boldSystemFont(ofSize: 17)
        self.addSubview(commodityLaber)
        commodityLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(userLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
        
        //商品图片
        commodityIcon.image = UIImage.init(named: "apply_status")
        self.addSubview(commodityIcon)
        commodityIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(61)
            ConstraintMaker.top.equalTo(commodityLaber.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //商品名称
        commodityNameLaber.text = "商品名称名称名称"
        commodityNameLaber.textColor = UIColor.black
        commodityNameLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(commodityNameLaber)
        commodityNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityLaber.snp.bottom).offset(15)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        //展开
        expandLaber.text = "展开"
        expandLaber.textColor = UIColor.hex(hexString: "#999999")
        expandLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(expandLaber)
        expandLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-30)
            ConstraintMaker.top.equalTo(commodityLaber.snp.bottom).offset(15)
        }
        //展开图标
        expandIcon.image = UIImage.init(named: "drop_down")
        self.addSubview(expandIcon)
        expandIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(6)
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.top.equalTo(commodityLaber.snp.bottom).offset(20)
        }
        
        //商品规格
        commoditySpecificationLaber.text = "规格: 默认"
        commoditySpecificationLaber.textColor = UIColor.hex(hexString: "#999999")
        commoditySpecificationLaber.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(commoditySpecificationLaber)
        commoditySpecificationLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityNameLaber.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        //商品价格
        commodityPriceLaber.text = "￥43843.00"
        commodityPriceLaber.textColor = UIColor.black
        commodityPriceLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(commodityPriceLaber)
        commodityPriceLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commoditySpecificationLaber.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        //商品数量
        commodityNumberLaber.text = "x2"
        commodityNumberLaber.textColor = UIColor.hex(hexString: "#999999")
        commodityNumberLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(commodityNumberLaber)
        commodityNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
            ConstraintMaker.top.equalTo(commodityLaber.snp.bottom).offset(65)
        }
        //商品分割线
        commodityLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(commodityLine)
        commodityLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(commodityPriceLaber.snp.bottom).offset(15)
        }
        //订单编号
        orderNumberLabel.text = "订单编号：2000000000009301"
        orderNumberLabel.textColor = UIColor.hex(hexString: "#999999")
        orderNumberLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderNumberLabel)
        orderNumberLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //下单时间
        orderTimeLaber.text = "下单时间：2019-06-11 10:39:46"
        orderTimeLaber.textColor = UIColor.hex(hexString: "#999999")
        orderTimeLaber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderTimeLaber)
        orderTimeLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderNumberLabel.snp.bottom).offset(11)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //买家留言上边分割线
        leaveCommentsTopLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(leaveCommentsTopLine)
        leaveCommentsTopLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(orderTimeLaber.snp.bottom).offset(15)
        }
        //买家留言
        leaveCommentsLaber.text = "买家留言 : "
        leaveCommentsLaber.textColor = UIColor.hex(hexString: "#999999")
        leaveCommentsLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(leaveCommentsLaber)
        leaveCommentsLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsTopLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //买家留言右边内容
        leaveCommentsRightLaber.text  = "需要商品订单发票抬头，谢谢"
        leaveCommentsRightLaber.textColor = UIColor.black
        leaveCommentsRightLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(leaveCommentsRightLaber)
        leaveCommentsRightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsTopLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalTo(leaveCommentsLaber.snp.right).offset(8)
        }
        //买家留言下边分割线
        leaveCommentsBottomLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(leaveCommentsBottomLine)
        leaveCommentsBottomLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(leaveCommentsLaber.snp.bottom).offset(15)
        }
        //运费
        freightLaber.text = "运费:"
        freightLaber.textColor = UIColor.hex(hexString: "#333333")
        freightLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(freightLaber)
        freightLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsBottomLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //运费价格
        freightPriceLaber.text = "￥199.00"
        freightPriceLaber.textColor = UIColor.hex(hexString: "#333333")
        freightPriceLaber.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(freightPriceLaber)
        freightPriceLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsBottomLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalTo(freightLaber.snp.right).offset(8)
        }
        //总计
        totalLaber.text = "总计:"
        totalLaber.textColor = UIColor.hex(hexString: "#333333")
        totalLaber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(totalLaber)
        totalLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(freightLaber.snp.bottom).offset(10)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //总计价格
        totalPriceLaber.text = "￥199.00"
        totalPriceLaber.textColor = UIColor.hex(hexString: "#FF4444")
        totalPriceLaber.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(totalPriceLaber)
        totalPriceLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(freightPriceLaber.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(totalLaber.snp.right).offset(8)
        }
        //分割线
        totalLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(totalLine)
        totalLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(totalPriceLaber.snp.bottom).offset(15)
        }
        //价格修改按钮
        priceModifyBg.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        priceModifyBg.setTitle("价格修改", for: UIControl.State.normal)
        priceModifyBg.setTitleColor(UIColor.white, for: UIControl.State.normal)
        priceModifyBg.layer.masksToBounds = true
        priceModifyBg.layer.cornerRadius = 4
        priceModifyBg.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.addSubview(priceModifyBg)
        priceModifyBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(94)
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
            ConstraintMaker.top.equalTo(totalLine.snp.bottom).offset(10)
        }

    }
}
