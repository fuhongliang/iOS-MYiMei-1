//
//  UAccountSafeView.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/4.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UAccountSafeView: BaseView {
    //MARK:申明各种控件变量
    
    //白色背景
    var backgroundWhite = UIImageView()
    
    //绑定手机
    var bindPhoneLabel = UILabel()
    var phoneNumberLabel = UILabel()
    
    //登录账号
    var loginAccountLabel = UILabel()
    var accountNameLabel = UILabel()
    
    //修改密码
    var changePasswordLabel = UILabel()
    var rightArrow = UIImageView()
    
    //灰色线
    var bindLine = UIView()
    var accountLine = UIView()
    
    var submitButton = UIButton()
    
    //MARK:初始化试图控件
    func configUI() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        
        //MARK:背景颜色
        self.addSubview(backgroundWhite)
        backgroundWhite.backgroundColor = UIColor.white
        backgroundWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.height.equalTo(148)
            ConstraintMaker.width.equalToSuperview()
        }
        
        //MARK:绑定手机
        self.addSubview(bindPhoneLabel)
        bindPhoneLabel.text = "绑定手机"
        bindPhoneLabel.textColor = UIColor.black
        bindPhoneLabel.font = UIFont.systemFont(ofSize: 17)
        bindPhoneLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(backgroundWhite.snp.top).offset(14)
        }
        
        //MARK:手机号
        self.addSubview(phoneNumberLabel)
        phoneNumberLabel.text = "13265345992"
        phoneNumberLabel.textColor = UIColor.hex(hexString: "#666666")
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 17)
        phoneNumberLabel.snp.makeConstraints { (ConstraintMaker) in
           ConstraintMaker.top.equalTo(backgroundWhite.snp.top).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        //MARK:绑定手机分割线
        self.addSubview(bindLine)
        bindLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        bindLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(bindPhoneLabel.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        self.addSubview(loginAccountLabel)
        loginAccountLabel.text = "登录账号"
        loginAccountLabel.textColor = UIColor.black
        loginAccountLabel.font = UIFont.systemFont(ofSize: 17)
        loginAccountLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(bindLine.snp.bottom).offset(14)
        }
        
        self.addSubview(accountNameLabel)
        accountNameLabel.text = "yuyixin123456"
        accountNameLabel.textColor = UIColor.hex(hexString: "#666666")
        accountNameLabel.font = UIFont.systemFont(ofSize: 17)
        accountNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(bindLine.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        self.addSubview(accountLine)
        accountLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        accountLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(loginAccountLabel.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        self.addSubview(changePasswordLabel)
        changePasswordLabel.text = "修改手机"
        changePasswordLabel.textColor = UIColor.black
        changePasswordLabel.font = UIFont.systemFont(ofSize: 17)
        changePasswordLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(accountLine.snp.bottom).offset(14)
        }
        
        self.addSubview(rightArrow)
        rightArrow.image = UIImage.init(named: "notice")
        rightArrow.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.top.equalTo(accountLine.snp.bottom).offset(14)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        self.addSubview(submitButton)
        submitButton.setTitle("退出登录", for: .normal)
        submitButton.titleLabel?.textColor = UIColor.white
        submitButton.clipsToBounds = true
        submitButton.layer.cornerRadius = 3
        submitButton.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        submitButton.snp.makeConstraints { (ConstraintMaker) in
    
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview().offset(-10)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalToSuperview()
        }
        
        
    }
    
}
