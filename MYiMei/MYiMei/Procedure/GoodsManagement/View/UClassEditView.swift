//
//  UClassEditView.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UClassEditView: BaseView {
    
    //MARK:分类名称
    var classNameLabel = UILabel()
    var classNameTF = UITextField()
    var classNameBgWhite = UIView()
    
    //MARK:分类排序
    var classSortLabel = UILabel()
    var classSortTF = UITextField()
    var classSortBgWhite = UIView()
    
    //MARK:保存
    var saveBtn = UIButton()
    
    
    func configUI(){
        
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        //MARK:分类名称白色背景
        classNameBgWhite.backgroundColor = UIColor.white
        self.addSubview(classNameBgWhite)
        classNameBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.left.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            
        }
        
        //MARK:分排序白色背景
        classSortBgWhite.backgroundColor = UIColor.white
        self.addSubview(classSortBgWhite)
        classSortBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalTo(classNameBgWhite.snp.bottom).offset(15)
            ConstraintMaker.height.equalTo(44)
            
        }
        
        //MARK:分类名称
        classNameLabel.text = "分类名称"
        classNameLabel.font = UIFont.systemFont(ofSize: 17)
        classNameLabel.textColor = UIColor.black
        self.addSubview(classNameLabel)
        classNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(14)
        }
        
        classNameTF.placeholder = "请输入分类名称"
        classNameTF.font = UIFont.systemFont(ofSize: 17)
        classNameTF.textAlignment = .right
        self.addSubview(classNameTF)
        classNameTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(200)
            ConstraintMaker.top.equalToSuperview()
        }
        
        //MARK:分类排序
        classSortLabel.text = "排序"
        classSortLabel.font = UIFont.systemFont(ofSize: 17)
        classSortLabel.textColor = UIColor.black
        self.addSubview(classSortLabel)
        classSortLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(classSortBgWhite.snp.top).offset(14)
        }
        
        classSortTF.placeholder = "请输入分类名称"
        classSortTF.font = UIFont.systemFont(ofSize: 17)
        classSortTF.textAlignment = .right
        classSortTF.keyboardType = UIKeyboardType.numberPad
        self.addSubview(classSortTF)
        classSortTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(200)
            ConstraintMaker.top.equalTo(classSortBgWhite.snp.top)
        }
        
        //MARK:保存
        saveBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        saveBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        saveBtn.setTitle("保存", for: UIControl.State.normal)
        saveBtn.layer.masksToBounds = true
        saveBtn.layer.cornerRadius = 3
        saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(classSortBgWhite.snp.bottom).offset(40)
            ConstraintMaker.height.equalTo(44)
        }
    }
    
}
