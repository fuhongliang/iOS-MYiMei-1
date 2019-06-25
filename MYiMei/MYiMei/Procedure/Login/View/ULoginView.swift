//
//  ULoginView.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol ULoginViewDelegate: AnyObject {
    func okTapAction(phoneNumber: String,password: String)
}

class ULoginView: BaseView {
    //标题
    var titleLabel = UILabel()
    //字段说明
    var phoneLabel = UILabel()
    var pwdLabel = UILabel()
    //手机号和密码
    var phoneNumberEdit = UITextField()
    var pwdEdit = UITextField()
    //分割线
    var phoneLine = UIImageView()
    var pwdLine = UIImageView()

    //说明
    var descrLabel = UILabel()

    //登录按钮
    var loginBtn = UIButton()

    weak var delegate: ULoginViewDelegate?

    func setLoginView(passWordLogin:Bool){
        self.backgroundColor = UIColor.white

        //标题
        titleLabel.tintColor = UIColor.black
        titleLabel.text = "欢迎您！"
        titleLabel.font = UIFont.systemFont(ofSize: 28)
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(118)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(27)
        }

        //手机号
        phoneLabel.tintColor = UIColor.black
        phoneLabel.text = "手机号"
        phoneLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(titleLabel.snp.bottom).offset(45)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.height.equalTo(16)
        }

        phoneNumberEdit.tintColor = UIColor.hex(hexString: "#999999")
        phoneNumberEdit.textColor = UIColor.black
        phoneNumberEdit.placeholder = "请输入手机号"
        phoneNumberEdit.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(phoneNumberEdit)
        phoneNumberEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(titleLabel.snp.bottom).offset(45)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(63)
            ConstraintMaker.height.equalTo(16)
        }

        //分割线
        phoneLine.backgroundColor = UIColor.hex(hexString: "#CCCCCC")
        self.addSubview(phoneLine)
        phoneLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(phoneNumberEdit.snp.bottom).offset(20)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }


        //密码

        pwdLabel.text = "密  码"
        pwdLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(pwdLabel)
        pwdLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(phoneLine.snp.bottom).offset(30)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.height.equalTo(16)
        }

        pwdEdit.tintColor = UIColor.hex(hexString: "#999999")
        pwdEdit.textColor = UIColor.black
        pwdEdit.placeholder = "请输入密码"
        pwdEdit.font = UIFont.systemFont(ofSize: 17)
        pwdEdit.isSecureTextEntry = true
        self.addSubview(pwdEdit)
        pwdEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(phoneLine.snp.bottom).offset(30)
            ConstraintMaker.left.equalToSuperview().offset(63)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(16)
        }

        //分割线
        pwdLine.backgroundColor = UIColor.hex(hexString: "#CCCCCC")
        self.addSubview(pwdLine)
        pwdLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(pwdEdit.snp.bottom).offset(20)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }

        //说明
        descrLabel.tintColor = UIColor.hex(hexString: "#666666")
        descrLabel.text = "点击登录及表示同意商户端平台管理协议"
        descrLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(descrLabel)
        descrLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(pwdLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(14)
        }

        //登录按钮

        loginBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        loginBtn.tintColor = UIColor.white
        loginBtn.setTitle("登录", for: UIControl.State.normal)
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.cornerRadius = 3
        self.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(descrLabel.snp_bottomMargin).offset(51)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
        }

        if (passWordLogin){

        }else{

        }

        loginBtn.addTarget(self, action: #selector(okTapAction), for: UIControl.Event.touchDown)

    }

    @objc func okTapAction() {
        delegate?.okTapAction(phoneNumber: phoneNumberEdit.text!,password:pwdEdit.text!)
    }
}

