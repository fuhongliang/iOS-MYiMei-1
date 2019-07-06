//
//  UMchJoinView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit


protocol UMchJoinViewDelegate: AnyObject {
    func tapChooseStoreLogoPicAction()
    func tapChooseStoreBgPicAction()
    func tapPushApply()
}

class UMchJoinView: BaseView {
    //标题
    var titleLabel =  UILabel()
    //字段说明
    var contactLabel = UILabel()
    var phoneNumberLabel = UILabel()
    var storeNameLabel = UILabel()
    var storeCategoryLabel = UILabel()
    var storeAddressLabel = UILabel()
    var consumerPhoneLaber = UILabel()
    var storePhotoLabel = UILabel()
    var storeBgLabel = UILabel()
    var storeBgDescriptionLabel = UILabel()
    var storeLoginLabel = UILabel()
    var storeLoginDescriptionLabel = UILabel()
    //输入框
    var contactEdit = UITextField()
    var phoneNumberEdit = UITextField()
    var storeNameEdit = UITextField()
    var storeAddressEdit = UITextField()
    var consumerPhoneEdit = UITextField()
    //分割线
    var contactLine = UILabel()
    var phoneNumberLine = UILabel()
    var storeNameLine = UILabel()
    var storeCategoryLine = UILabel()
    var storeAddressLine = UILabel()
    var storeAddressEditLine = UILabel()

    var storeBgLebelLine = UILabel()
    var storeLoginLine = UILabel()
    //背景
    var whiteBg = UIImageView()
    var whiteBgone = UIImageView()
    //选择对话框
    var storeCategoryDialog = UILabel()
    var storeAddressDialog = UILabel()
    //小图标
    var storeCategoryIcon = UIImageView()
    var storeAddressIcon = UIImageView()
    var storeBgBtn = UIButton()
    var storeLogoBtn = UIButton()
    
    //按钮
    var joinButton = UIButton()
    weak var delegate: UMchJoinViewDelegate?

    func setView(){
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        //MARK:店铺信息
        titleLabel.text = "店铺基本信息"
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.hex(hexString: "#808080")
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(20)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.width.equalToSuperview()
        }
        
        //MARK:白色背景
        whiteBg.backgroundColor = UIColor.white
        self.addSubview(whiteBg)
        whiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview().offset(44)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(314)
        }
        
        
        //MARK:联系人
        contactLabel.tintColor = UIColor.black
        contactLabel.text = "联系人"
        contactLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(contactLabel)
        contactLabel.snp.makeConstraints{(ConstraintMaker)in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(14)
        }
    
        contactEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        contactEdit.textColor = UIColor.black
        contactEdit.placeholder = "请输入"
        contactEdit.textAlignment = .right
        contactEdit.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(contactEdit)
        contactEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBg.snp.top)
            ConstraintMaker.left.equalTo(contactLabel.snp.right).offset(30)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(280)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
    contactLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(contactLine)
        contactLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(contactEdit.snp.bottom)
        }
        
        
        //MARK:手机号
        phoneNumberLabel.tintColor = UIColor.black
        phoneNumberLabel.text = "手机号"
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints{(ConstraintMaker)in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(contactLine.snp.bottom).offset(14)
        }
        
        phoneNumberEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        phoneNumberEdit.textColor = UIColor.black
        phoneNumberEdit.placeholder = "请输入"
        phoneNumberEdit.font = UIFont.systemFont(ofSize: 17)
        phoneNumberEdit.textAlignment = .right
        self.addSubview(phoneNumberEdit)
        phoneNumberEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(contactLine.snp.top)
            ConstraintMaker.left.equalTo(phoneNumberLabel.snp.right).offset(30)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(280)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }

        phoneNumberLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(phoneNumberLine)
        phoneNumberLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(phoneNumberEdit.snp.bottom)
        }
        
        //MARK:店铺名称
        storeNameLabel.text = "店铺名称"
        storeNameLabel.tintColor = UIColor.black
        storeNameLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeNameLabel)
        storeNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(phoneNumberLine.snp.bottom).offset(14)
        }
        
        storeNameEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        storeNameEdit.textColor = UIColor.black
        storeNameEdit.placeholder = "请输入"
        storeNameEdit.font = UIFont.systemFont(ofSize: 17)
        storeNameEdit.textAlignment = .right
        self.addSubview(storeNameEdit)
        storeNameEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(phoneNumberLine.snp.bottom)
            ConstraintMaker.left.equalTo(storeNameLabel.snp.right).offset(30)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(280)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        storeNameLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeNameLine)
        storeNameLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeNameEdit.snp.bottom)
        }
        
        //MARK:店铺分类
        storeCategoryLabel.text = "店铺分类"
        storeCategoryLabel.textColor = UIColor.black
        storeCategoryLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeCategoryLabel)
        storeCategoryLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeNameLine.snp.bottom).offset(14)
        }
        
        storeCategoryDialog.text = "请选择"
        storeCategoryDialog.tintColor = UIColor.hex(hexString: "#CCCCCC")
        storeCategoryDialog.textColor = UIColor.hex(hexString: "#CCCCCC")
        storeCategoryDialog.font = UIFont.systemFont(ofSize: 17)
        storeCategoryDialog.textAlignment = .right
        self.addSubview(storeCategoryDialog)
        storeCategoryDialog.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeNameLine.snp.bottom)
            ConstraintMaker.left.equalTo(storeCategoryDialog.snp.right).offset(30)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(260)
            ConstraintMaker.right.equalToSuperview().offset(-33)
        }
        
        storeCategoryIcon.image = UIImage.init(named: "notice")
        self.addSubview(storeCategoryIcon)
        storeCategoryIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.left.equalTo(storeCategoryDialog.snp.right).offset(9)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(storeNameLine.snp.bottom).offset(15)
        }
        
        storeCategoryLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeCategoryLine)
        storeCategoryLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeCategoryDialog.snp.bottom)
        }
        
        //MARK:店铺地址
        storeAddressLabel.text = "店铺地址"
        storeAddressLabel.textColor = UIColor.black
        storeAddressLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeAddressLabel)
        storeAddressLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeCategoryLine.snp.bottom).offset(14)
        }

        storeAddressDialog.text = "请选择"
        storeAddressDialog.tintColor = UIColor.hex(hexString: "#CCCCCC")
        storeAddressDialog.textColor = UIColor.hex(hexString: "#CCCCCC")
        storeAddressDialog.font = UIFont.systemFont(ofSize: 17)
        storeAddressDialog.textAlignment = .right
        self.addSubview(storeAddressDialog)
        storeAddressDialog.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeCategoryLine.snp.bottom)
            ConstraintMaker.left.equalTo(storeAddressDialog.snp.right).offset(30)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(260)
            ConstraintMaker.right.equalToSuperview().offset(-33)
        }

        storeAddressIcon.image = UIImage.init(named: "notice")
        self.addSubview(storeAddressIcon)
        storeAddressIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.left.equalTo(storeAddressDialog.snp.right).offset(9)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(storeCategoryLine.snp.bottom).offset(15)
        }

        storeAddressLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeAddressLine)
        storeAddressLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeAddressDialog.snp.bottom)
        }
        
        storeAddressEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        storeAddressEdit.textColor = UIColor.black
        storeAddressEdit.placeholder = "详细地址例: 1号楼101室"
        storeAddressEdit.font = UIFont.systemFont(ofSize: 17)
        storeAddressEdit.textAlignment = .left
        self.addSubview(storeAddressEdit)
        storeAddressEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(storeAddressLine.snp.bottom)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        storeAddressEditLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeAddressEditLine)
        storeAddressEditLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(storeAddressEdit.snp.bottom)
        }
        
        //MARK:客服电话
        consumerPhoneLaber.text = "客服电话"
        consumerPhoneLaber.textColor = UIColor.black
        consumerPhoneLaber.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(consumerPhoneLaber)
        consumerPhoneLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeAddressEditLine.snp.bottom).offset(14)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        consumerPhoneEdit.tintColor = UIColor.hex(hexString: "#CCCCCC")
        consumerPhoneEdit.placeholder = "请输入"
        consumerPhoneEdit.textColor = UIColor.black
        consumerPhoneEdit.font = UIFont.systemFont(ofSize: 17)
        consumerPhoneEdit.textAlignment = .right
        self.addSubview(consumerPhoneEdit)
        consumerPhoneEdit.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeAddressEditLine.snp.bottom)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.left.equalTo(consumerPhoneLaber.snp.right).offset(30)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
    

        //MARK:店铺照片
        storePhotoLabel.text = "店铺照片"
        storePhotoLabel.textColor = UIColor.hex(hexString: "#808080")
        self.addSubview(storePhotoLabel)
        storePhotoLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(whiteBg.snp.bottom).offset(19)
        }
        //MARK:第二块白色背景图
        whiteBgone.backgroundColor = UIColor.white
        self.addSubview(whiteBgone)
        whiteBgone.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(181)
            ConstraintMaker.top.equalTo(storePhotoLabel.snp.bottom).offset(11)
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
        }
        
        //MARK:店铺背景
        storeBgLabel.text = "店铺背景"
        storeBgLabel.textColor = UIColor.black
        storeBgLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeBgLabel)
        storeBgLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBgone.snp.top).offset(37)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        
        storeBgBtn.setBackgroundImage(UIImage.init(named: "add"), for: UIControl.State.normal)
        self.addSubview(storeBgBtn)
        storeBgBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(60)
            ConstraintMaker.left.equalTo(storeBgLabel.snp.right).offset(55)
            ConstraintMaker.right.equalTo(-171)
            ConstraintMaker.top.equalTo(whiteBgone.snp.top).offset(15)
        }
        storeBgDescriptionLabel.text = "顶部店铺背景（支持jpg、jprg、png格式，大小不超过1mb尺寸建议750*300px"
        storeBgDescriptionLabel.font = UIFont.systemFont(ofSize: 12)
        storeBgDescriptionLabel.lineBreakMode = .byWordWrapping
        storeBgDescriptionLabel.numberOfLines = 0
        storeBgDescriptionLabel.textColor = UIColor.hex(hexString: "#CCCCCC")
        self.addSubview(storeBgDescriptionLabel)
        storeBgDescriptionLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBgone.snp.top).offset(19)
            ConstraintMaker.left.equalTo(storeBgBtn.snp.right).offset(12)
            ConstraintMaker.right.equalToSuperview().offset(-13)
        }
        
        storeBgLebelLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        self.addSubview(storeBgLebelLine)
        storeBgLebelLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(storeBgBtn.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }


        storeBgBtn.addTarget(self, action: #selector(chooseStoreBgPicAction), for: UIControl.Event.touchDown)

        //MARK:店铺logo
        storeLoginLabel.text = "店铺LOGO"
        storeLoginLabel.textColor = UIColor.black
        storeLoginLabel.font = UIFont.systemFont(ofSize: 17)
        self.addSubview(storeLoginLabel)
        storeLoginLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeBgLebelLine.snp.bottom).offset(37)
            ConstraintMaker.left.equalToSuperview().offset(15)
        }
        storeLogoBtn.setBackgroundImage(UIImage.init(named: "add"), for: UIControl.State.normal)
        self.addSubview(storeLogoBtn)
        storeLogoBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeBgLebelLine.snp.bottom).offset(15)
            ConstraintMaker.left.equalTo(storeLoginLabel.snp.right).offset(40)
            ConstraintMaker.size.equalTo(60)
            ConstraintMaker.right.equalTo(-171)
        }
        storeLogoBtn.addTarget(self, action: #selector(chooseStoreLogoPicAction), for: UIControl.Event.touchDown)

        storeLoginDescriptionLabel.text = "顶部店铺背景（支持jpg、jprg、png格式，大小不超过1mb尺寸建议750*300px"
        storeLoginDescriptionLabel.font = UIFont.systemFont(ofSize: 12)
        storeLoginDescriptionLabel.lineBreakMode = .byWordWrapping
        storeLoginDescriptionLabel.numberOfLines = 0
        storeLoginDescriptionLabel.textColor = UIColor.hex(hexString: "#CCCCCC")
        self.addSubview(storeLoginDescriptionLabel)
        storeLoginDescriptionLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeBgLebelLine.snp.top).offset(19)
            ConstraintMaker.left.equalTo(storeLogoBtn.snp.right).offset(12)
            ConstraintMaker.right.equalToSuperview().offset(-13)
        }
        storeLogoBtn.addTarget(self, action: #selector(chooseStoreLogoPicAction), for: UIControl.Event.touchDown)

         //MARK:提交审核
        joinButton.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        joinButton.setTitle("提交审核", for: UIControl.State.normal)
        joinButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        joinButton.layer.masksToBounds = true
        joinButton.layer.cornerRadius = 3
        joinButton.titleLabel?.font = UIFont .boldSystemFont(ofSize: 17)
        self.addSubview(joinButton)
        joinButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(whiteBgone.snp.bottom).offset(49)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
        }
        joinButton.addTarget(self, action: #selector(pushAppyAction), for: UIControl.Event.touchDown)
    }

    @objc func chooseStoreLogoPicAction() {
        delegate?.tapChooseStoreLogoPicAction()
    }

    @objc func chooseStoreBgPicAction() {
        delegate?.tapChooseStoreBgPicAction()
    }

    @objc func pushAppyAction() {
        delegate?.tapPushApply()
    }
}
