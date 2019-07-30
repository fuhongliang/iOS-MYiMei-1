//
//  URefundOrderUntreatedCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/29.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class URefundOrderUntreatedCell: UBaseTableViewCell {
    
    //MARK:订单号&状态
    var orderNoLabel:UILabel = {
        let ul = UILabel()
        ul.text = "订单号:"
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    
    var orderStatus:UILabel = {
        let ul = UILabel()
        ul.text = "待处理"
        ul.textColor = UIColor.hex(hexString: "#FF8A17")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    
    //MARK:订单号下的线🧵
    var orderLine:UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:联系人的灰色按钮
    var grayBgBtn:UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        ub.layer.cornerRadius = 3
        ub.clipsToBounds = true
        return ub
    }()
    //联系人名字
    var userNameLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.black
        ul.font = UIFont.boldSystemFont(ofSize: 14)
        return ul
    }()
    //联系人电话
    var userPhoneLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.black
        ul.font = UIFont.boldSystemFont(ofSize: 14)
        return ul
    }()
    //电话图标
    var phoneIcon:UIImageView = {
        let uiv = UIImageView()
        uiv.image = UIImage.init(named: "phoneIcon")
        return uiv
    }()
    //联系收货人
    var contactLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#1C98F6")
        ul.font = UIFont.systemFont(ofSize: 12)
        return ul
    }()
    
    //MARK:商品信息
    //商品图片
    var goodsIcon:UIImageView = {
        let uiv = UIImageView()
        uiv.layer.cornerRadius = 2
        uiv.layer.masksToBounds = true
        return uiv
    }()
    //商品名称
    var goodsNameLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    //商品规格
    var goodsSpecification:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 12)
        return ul
    }()
    //商品价格
    var goodsPrice:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    //商品数量
    var goodsNumber:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 12)
        return ul
    }()
    
    //MARK:商品信息下的线🧵
    var goodsLine:UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:售后详情
    var afterSalesLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        ul.text = "售后类型:"
        return ul
    }()
    //具体的售后类型
    var afterSalesContentLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        return ul
    }()
    //退款金额标题
    var refundMoneyLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        ul.text = "退款金额:"
        return ul
    }()
    //退款金额
    var refundMoneyContentLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#FF4444")
        ul.font = UIFont.systemFont(ofSize: 13)
        return ul
    }()
    //申请理由
    var refundCauseLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        ul.text = "申请理由:"
        return ul
    }()
    var refundCauseContentLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        return ul
    }()
    
    //MARK:售后详情下的线🧵
    var refundLine:UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    var confirmRefund:UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        ub.layer.cornerRadius = 15
        ub.layer.masksToBounds = true
        ub.setTitle("同意退款退货", for: .normal)
        ub.setTitleColor(UIColor.white, for: .normal)
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return ub
    }()
    
    var refusedRefund:UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.hex(hexString: "#FF4444")
        ub.layer.cornerRadius = 15
        ub.layer.masksToBounds = true
        ub.setTitle("拒绝退款退货", for: .normal)
        ub.setTitleColor(UIColor.white, for: .normal)
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return ub
    }()
    
    override func configUI() {
        
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        self.addSubview(orderNoLabel)
        orderNoLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.equalToSuperview().offset(15)
        }
        
        self.addSubview(orderStatus)
        orderStatus.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.top.equalToSuperview().inset(15)
        }
        
        self.addSubview(orderLine)
        orderLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.width.equalToSuperview()
            ConstraintMaker.top.equalTo(orderNoLabel.snp.bottom).offset(15)
        }
        
        self.addSubview(grayBgBtn)
        grayBgBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview().inset(15)
            ConstraintMaker.top.equalTo(orderLine.snp.bottom).offset(11)
            ConstraintMaker.height.equalTo(40)
        }
        
        self.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(grayBgBtn).offset(10)
            ConstraintMaker.centerY.equalTo(grayBgBtn)
        }
        
        self.addSubview(userPhoneLabel)
        userPhoneLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(userNameLabel.snp.right).offset(25)
            ConstraintMaker.centerY.equalTo(grayBgBtn)
        }
        
        self.addSubview(contactLabel)
        contactLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(grayBgBtn).offset(-10)
            ConstraintMaker.centerY.equalTo(grayBgBtn)
        }
        
        self.addSubview(phoneIcon)
        phoneIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(contactLabel.snp.left).offset(-7)
            ConstraintMaker.centerY.equalTo(grayBgBtn)
            ConstraintMaker.size.equalTo(13)
        }
        
        self.addSubview(goodsIcon)
        goodsIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalTo(grayBgBtn.snp.bottom).offset(15)
            ConstraintMaker.size.equalTo(61)
        }
        
        self.addSubview(goodsNameLabel)
        goodsNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(goodsIcon)
            ConstraintMaker.left.equalTo(goodsIcon.snp.right).offset(11)
        }
        
        self.addSubview(goodsSpecification)
        goodsSpecification.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsIcon.snp.right).offset(11)
            ConstraintMaker.centerY.equalTo(goodsIcon)
        }
        
        self.addSubview(goodsPrice)
        goodsPrice.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(grayBgBtn)
            ConstraintMaker.left.equalTo(goodsIcon.snp.right).offset(11)
        }
        
        self.addSubview(goodsNumber)
        goodsNumber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.bottom.equalTo(grayBgBtn)
        }
        
        self.addSubview(goodsLine)
        goodsLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(goodsIcon.snp.bottom).offset(15)
            ConstraintMaker.left.right.equalToSuperview().inset(15)
        }
        
        self.addSubview(afterSalesLabel)
        afterSalesLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(goodsLine.snp.bottom).offset(15)
        }
        
        self.addSubview(afterSalesContentLabel)
        afterSalesContentLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(afterSalesLabel.snp.right).offset(3)
            ConstraintMaker.top.equalTo(afterSalesLabel)
        }
        
        self.addSubview(refundMoneyLabel)
        refundMoneyLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(afterSalesLabel.snp.bottom).offset(8)
            ConstraintMaker.left.equalTo(afterSalesLabel)
        }
        
        self.addSubview(refundMoneyContentLabel)
        refundMoneyContentLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(refundMoneyLabel.snp.right).offset(3)
            ConstraintMaker.top.equalTo(refundMoneyLabel)
        }
        
        self.addSubview(refundCauseLabel)
        refundCauseLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(refundMoneyLabel.snp.bottom).offset(8)
            ConstraintMaker.left.equalTo(refundMoneyLabel)
        }
        
        self.addSubview(refundCauseContentLabel)
        refundCauseContentLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(refundCauseLabel.snp.right).offset(3)
            ConstraintMaker.top.equalTo(refundCauseLabel)
        }
        
        self.addSubview(refundLine)
        refundLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(refundCauseLabel.snp.bottom).offset(15)
            ConstraintMaker.width.equalToSuperview()
        }
        
        self.addSubview(confirmRefund)
        confirmRefund.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(refundLine.snp.bottom)
        }
        
        self.addSubview(confirmRefund)
        confirmRefund.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(confirmRefund).offset(-15)
            ConstraintMaker.top.equalTo(refundLine.snp.bottom)
        }
        
    }
    
}
