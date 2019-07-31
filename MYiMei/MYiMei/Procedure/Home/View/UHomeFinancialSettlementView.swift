//
//  UHomeFinancialSettlementView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/30.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UHomeFinancialSettlementView: BaseView {
    var overBg = UIImageView()
    var overLaber = UILabel()
    var overNumberLaber = UILabel()
    var withdrawBtn = UIButton()
    func setView() {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        overBg.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        self.addSubview(overBg)
        overBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(105)
        }
        overLaber.text = "账户余额(元)"
        overLaber.textColor = UIColor.hex(hexString: "#DDF0FF")
        overLaber.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(overLaber)
        overLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(overBg.snp.top).offset(20)
        }
        overNumberLaber.text = "￥8790.23"
        overNumberLaber.textColor = UIColor.white
        overNumberLaber.font = UIFont.boldSystemFont(ofSize: 26)
        self.addSubview(overNumberLaber)
        overNumberLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(overLaber.snp.bottom).offset(20)
        }
        withdrawBtn.setTitle("提现", for: UIControl.State.normal)
        withdrawBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        withdrawBtn.layer.borderColor = UIColor.white.cgColor
        withdrawBtn.layer.borderWidth = 1
        withdrawBtn.layer.cornerRadius = 3
        withdrawBtn.layer.masksToBounds = true
        self.addSubview(withdrawBtn)
        withdrawBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(overBg)
            ConstraintMaker.right.equalTo(overBg.snp.right).offset(-15)
            ConstraintMaker.height.equalTo(33)
            ConstraintMaker.width.equalTo(52)
        }
        
    }
}
