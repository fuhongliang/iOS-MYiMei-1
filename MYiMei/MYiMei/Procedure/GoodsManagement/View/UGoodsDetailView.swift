//
//  UGoodsDetailView.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/27.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import KMPlaceholderTextView

protocol UGoodsDetailViewDelegate: AnyObject {
    func tapChooseGoodsSLTAction()
    func tapChooseGoodsPicAction()
}

class UGoodsDetailView: BaseView {
    //商品名称
    var goodsNameTF = UITextField()
    //分割线
    var line = UIImageView()

    //白色的背景

    var bgWhite = UIImageView()

    //商品描述
    var goodsDescr = KMPlaceholderTextView()

    //商品缩略图
    var addGoodsCoverPic = UIButton()

    //商品主图
    var addGoodsPic = UIButton()

    //白色的背景
    var categoryBgWhite = UIImageView()


    //平台分类


    //商品分类


    //白色的背景
    var unitBgWhite = UIImageView()

    //单位


    //虚拟销量
    //重量
    //原价
    //售价
    //库存

    //白色的背景
    var piecesBgWhite = UIImageView()

    //单品满件包邮


    //白色的背景
    var foreheadBgWhite = UIImageView()

    //单品满额包邮

    //白色的背景
    var tagsBgWhite = UIImageView()
    //服务标签


    var sortCategoryBtn = UIButton()


    weak var delegate: UGoodsDetailViewDelegate?

    func configUI() {
        //商品名称
        goodsNameTF.backgroundColor = UIColor.white
        goodsNameTF.textColor = UIColor.black
        goodsNameTF.tintColor = UIColor.hex(hexString: "#CCCCCC")
        goodsNameTF.font = UIFont.systemFont(ofSize: 17)
        goodsNameTF.placeholder = "商品名称 (30字以内)"
        let leftview = UIView()
        leftview.frame = CGRect(x: 0, y: 0, width: 10, height: 44)
        leftview.frame.size.width = 15//设置左边距的大小
        leftview.backgroundColor = UIColor.white
        goodsNameTF.leftViewMode = UITextField.ViewMode.always
        goodsNameTF.leftView = leftview;
        self.addSubview(goodsNameTF)
        goodsNameTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalToSuperview()
        }
        //白色背景
        bgWhite.backgroundColor = UIColor.white
        self.addSubview(bgWhite)
        bgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(200)
            ConstraintMaker.top.equalTo(goodsNameTF.snp.bottom)
        }

        //分割线
        line.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(line)
        line.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(goodsNameTF.snp.bottom)
        }

        //描述
        goodsDescr.textColor = UIColor.black
        goodsDescr.tintColor = UIColor.hex(hexString: "#CCCCCC")
        goodsDescr.font = UIFont.systemFont(ofSize: 17)
        goodsDescr.placeholder = "描述下您的宝贝吧 (200字以内)"
        goodsDescr.placeholderFont = UIFont.systemFont(ofSize: 17)
        self.addSubview(goodsDescr)
        goodsDescr.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(12)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(110)
            ConstraintMaker.top.equalTo(goodsNameTF.snp.bottom).offset(1)
        }


        //添加缩略图
        addGoodsCoverPic.backgroundColor = UIColor.white
        addGoodsCoverPic.setBackgroundImage(UIImage.init(named: "add_goods_slt"), for: UIControl.State.normal)
        addGoodsCoverPic.layer.masksToBounds = true
        addGoodsCoverPic.layer.cornerRadius = 1
        self.addSubview(addGoodsCoverPic)
        addGoodsCoverPic.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(goodsDescr.snp.bottom).offset(5)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(70)
            ConstraintMaker.width.equalTo(70)
        }

        //添加商品图
        addGoodsPic.backgroundColor = UIColor.white
        addGoodsPic.setBackgroundImage(UIImage.init(named: "add_goods_pic"), for: UIControl.State.normal)
        addGoodsPic.layer.masksToBounds = true
        addGoodsPic.layer.cornerRadius = 1
        self.addSubview(addGoodsPic)
        addGoodsPic.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(goodsDescr.snp.bottom).offset(5)
            ConstraintMaker.left.equalTo(addGoodsCoverPic.snp.right).offset(15)
            ConstraintMaker.height.equalTo(70)
            ConstraintMaker.width.equalTo(70)
        }
        addGoodsCoverPic.addTarget(self, action: #selector(tapChooseGoodsSLTAction), for: UIControl.Event.touchDown)
        addGoodsPic.addTarget(self, action: #selector(tapChooseGoodsPicAction), for: UIControl.Event.touchDown)


        //白色背景
        categoryBgWhite.backgroundColor = UIColor.white
        self.addSubview(categoryBgWhite)
        categoryBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(89)
            ConstraintMaker.top.equalTo(bgWhite.snp.bottom).offset(15)
        }

        //白色背景
        unitBgWhite.backgroundColor = UIColor.white
        self.addSubview(unitBgWhite)
        unitBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(269)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.bottom).offset(15)
        }

        //piecesBgWhite
        piecesBgWhite.backgroundColor = UIColor.white
        self.addSubview(piecesBgWhite)
        piecesBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(unitBgWhite.snp.bottom).offset(44)
        }

        //foreheadBgWhite
        foreheadBgWhite.backgroundColor = UIColor.white
        self.addSubview(foreheadBgWhite)
        foreheadBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(piecesBgWhite.snp.bottom).offset(44)
        }

        //tagsBgWhite
        tagsBgWhite.backgroundColor = UIColor.white
        self.addSubview(tagsBgWhite)
        tagsBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(123)
            ConstraintMaker.top.equalTo(foreheadBgWhite.snp.bottom).offset(44)
        }
    }

    @objc func tapChooseGoodsSLTAction() {
        delegate?.tapChooseGoodsSLTAction()
    }

    @objc func tapChooseGoodsPicAction() {
        delegate?.tapChooseGoodsPicAction()
    }
}


