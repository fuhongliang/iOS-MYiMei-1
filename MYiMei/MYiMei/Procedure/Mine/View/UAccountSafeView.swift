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
    
    var bindPhoneLabel = UILabel()
    
    var phoneNumberLabel = UILabel()
    
    var bindLine = UIView()
    
    var loginAccountLabel = UILabel()
    
    var accountNameLabel = UILabel()
    
    var accountLine = UIView()
    
    var changePasswordLabel = UILabel()
    
    var rightArrow = UIImageView()
    
    
    
    
    //MARK:初始化试图控件
    func configUI() {
        bindPhoneLabel.text = "绑定手机"
        bindPhoneLabel.textColor = UIColor.black
        bindPhoneLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(bindPhoneLabel)
        bindPhoneLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(20)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.width.equalToSuperview()
        }
    }
    
}
