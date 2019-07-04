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
    var commodityPriceLeber = UILabel()
    var expandLeber = UILabel()
    var commodityNumberLeber = UILabel()
    var orderNumberLebel = UILabel()
    var orderTimeLeber = UILabel()
    var leaveCommentsLeber = UILabel()
    var leaveCommentsRightLeber = UILabel()
    var freightLeber = UILabel()
    var freightPriceLeber = UILabel()
    var totalLeber = UILabel()
    var totalPriceLeber = UILabel()
    
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
            ConstraintMaker.top.equalTo(userNameLeber.snp.bottom).offset(10)
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
        //展开
        expandLeber.text = "展开"
        expandLeber.textColor = UIColor.hex(hexString: "#999999")
        expandLeber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(expandLeber)
        expandLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-30)
            ConstraintMaker.top.equalTo(commodityLeber.snp.bottom).offset(15)
        }
        //展开图标
        expandIcon.image = UIImage.init(named: "drop_down")
        self.addSubview(expandIcon)
        expandIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(6)
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.top.equalTo(commodityLeber.snp.bottom).offset(20)
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
        commodityPriceLeber.text = "￥43843.00"
        commodityPriceLeber.textColor = UIColor.black
        commodityPriceLeber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(commodityPriceLeber)
        commodityPriceLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commoditySpecificationLeber.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(commodityIcon.snp.right).offset(11)
        }
        //商品数量
        commodityNumberLeber.text = "x2"
        commodityNumberLeber.textColor = UIColor.hex(hexString: "#999999")
        commodityNumberLeber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(commodityNumberLeber)
        commodityNumberLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
            ConstraintMaker.top.equalTo(commodityLeber.snp.bottom).offset(65)
        }
        //商品分割线
        commodityLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(commodityLine)
        commodityLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(commodityPriceLeber.snp.bottom).offset(15)
        }
        //订单编号
        orderNumberLebel.text = "订单编号：2000000000009301"
        orderNumberLebel.textColor = UIColor.hex(hexString: "#999999")
        orderNumberLebel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderNumberLebel)
        orderNumberLebel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(commodityLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //下单时间
        orderTimeLeber.text = "下单时间：2019-06-11 10:39:46"
        orderTimeLeber.textColor = UIColor.hex(hexString: "#999999")
        orderTimeLeber.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(orderTimeLeber)
        orderTimeLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(orderNumberLebel.snp.bottom).offset(11)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //买家留言上边分割线
        leaveCommentsTopLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(leaveCommentsTopLine)
        leaveCommentsTopLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(orderTimeLeber.snp.bottom).offset(15)
        }
        //买家留言
        leaveCommentsLeber.text = "买家留言 : "
        leaveCommentsLeber.textColor = UIColor.hex(hexString: "#999999")
        leaveCommentsLeber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(leaveCommentsLeber)
        leaveCommentsLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsTopLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //买家留言右边内容
        leaveCommentsRightLeber.text  = "需要商品订单发票抬头，谢谢"
        leaveCommentsRightLeber.textColor = UIColor.black
        leaveCommentsRightLeber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(leaveCommentsRightLeber)
        leaveCommentsRightLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsTopLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalTo(leaveCommentsLeber.snp.right).offset(8)
        }
        //买家留言下边分割线
        leaveCommentsBottomLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(leaveCommentsBottomLine)
        leaveCommentsBottomLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(leaveCommentsLeber.snp.bottom).offset(15)
        }
        //运费
        freightLeber.text = "运费:"
        freightLeber.textColor = UIColor.hex(hexString: "#333333")
        freightLeber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(freightLeber)
        freightLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsBottomLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //运费价格
        freightPriceLeber.text = "￥199.00"
        freightPriceLeber.textColor = UIColor.hex(hexString: "#333333")
        freightPriceLeber.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(freightPriceLeber)
        freightPriceLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(leaveCommentsBottomLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalTo(freightLeber.snp.right).offset(8)
        }
        //总计
        totalLeber.text = "总计:"
        totalLeber.textColor = UIColor.hex(hexString: "#333333")
        totalLeber.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(totalLeber)
        totalLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(freightLeber.snp.bottom).offset(10)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        //总计价格
        totalPriceLeber.text = "￥199.00"
        totalPriceLeber.textColor = UIColor.hex(hexString: "#FF4444")
        totalPriceLeber.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(totalPriceLeber)
        totalPriceLeber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(freightPriceLeber.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(totalLeber.snp.right).offset(8)
        }
        //分割线
        totalLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(totalLine)
        totalLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalTo(totalPriceLeber.snp.bottom).offset(15)
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
