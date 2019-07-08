//
//  UManagementClassificationCell.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UManagementClassificationCell: BaseView {
    //白色背景
    var whiteBg = UIImageView()
    //字段说明
    var seriesLaber = UILabel()
    //按钮
    var editBtn = UIButton()
    var deleteBtn = UIButton()
    //分割线
    var Line = UILabel()
    func setView()  {
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        whiteBg.backgroundColor = UIColor.white
        self.addSubview(whiteBg)
        whiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(48)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
        }
        seriesLaber.text = "现代系列"
        seriesLaber.textColor = UIColor.hex(hexString: "#666666")
        seriesLaber.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(seriesLaber)
        seriesLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(17)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        deleteBtn.backgroundColor = UIColor.white
        deleteBtn.setTitle("删除", for: UIControl.State.normal)
        deleteBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        deleteBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        deleteBtn.layer.borderWidth = 1
        deleteBtn.layer.cornerRadius = 2
        self.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(30)
            ConstraintMaker.width.equalTo(68)
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(9)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        editBtn.backgroundColor = UIColor.white
        editBtn.setTitle("编辑", for: UIControl.State.normal)
        editBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        editBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        editBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        editBtn.layer.borderWidth = 1
        editBtn.layer.cornerRadius = 2
        self.addSubview(editBtn)
        editBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(30)
            ConstraintMaker.width.equalTo(68)
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(9)
            ConstraintMaker.right.equalTo(deleteBtn.snp.left).offset(-15)
        }
        Line.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(Line)
        Line.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(deleteBtn.snp.bottom).offset(9)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
    }
}
