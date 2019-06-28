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
    var platformClassLabel = UILabel()
    //分割线
    var classLine = UIImageView()
    //选择平台分类
    var choosePlatformClassLabel = UILabel()

    var arrowRight = UIImageView()

    //商品分类
    var goodsClassLabel = UILabel()

    //选择商品分类
    var choosegoodsClassLabel = UILabel()

    var goodsArrowRight = UIImageView()

    //白色的背景
    var unitBgWhite = UIImageView()

    //单位
    var unitClassLabel = UILabel()

    //虚拟销量
    var virtualSalesLabel = UILabel()

    //重量
    var weightLabel = UILabel()

    //原价
    var originalPriceLabel = UILabel()

    //售价
    var goodsPriceLabel = UILabel()

    //库存
    var amountLabel = UILabel()

    //白色的背景
    var piecesBgWhite = UIImageView()

    //单品满件包邮
    var piecesDesrcLabel = UILabel()
    var piecesLabel = UILabel()

    //白色的背景
    var foreheadBgWhite = UIImageView()

    //单品满额包邮
    var foreheadDesrcLabel = UILabel()
    var foreDesrcLabel = UILabel()

    //白色的背景
    var tagsBgWhite = UIImageView()

    //服务标签
    var servicesDesrcLabel = UILabel()

    var saveBtn = UIButton()


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
            ConstraintMaker.width.equalTo(screenWidth)
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
            ConstraintMaker.left.equalToSuperview().offset(10)
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

        platformClassLabel.text = "平台分类"
        platformClassLabel.font = UIFont.systemFont(ofSize: 17)
        platformClassLabel.textColor = UIColor.black

        self.addSubview(platformClassLabel)
        platformClassLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.top).offset(14)
        }
        //分类输入

        choosePlatformClassLabel.text = "请选择平台分类"
        choosePlatformClassLabel.font = UIFont.systemFont(ofSize: 17)
        choosePlatformClassLabel.textColor = UIColor.hex(hexString: "#CCCCCC")
        choosePlatformClassLabel.textAlignment = .right

        self.addSubview(choosePlatformClassLabel)
        choosePlatformClassLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(platformClassLabel).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-34)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.top)
        }
        arrowRight.image = UIImage.init(named: "right_arrow")
        self.addSubview(arrowRight)
        arrowRight.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(choosePlatformClassLabel.snp.right).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.width.equalTo(8)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.top).offset(15)
        }
        //分割线
        classLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(classLine)
        classLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.top).offset(44)
        }


        goodsClassLabel.text = "商品分类"
        goodsClassLabel.font = UIFont.systemFont(ofSize: 17)
        goodsClassLabel.textColor = UIColor.black

        self.addSubview(goodsClassLabel)
        goodsClassLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
            ConstraintMaker.top.equalTo(classLine.snp.top).offset(14)
        }
        //商品分类输入
        choosegoodsClassLabel.text = "请选择商品分类"
        choosegoodsClassLabel.font = UIFont.systemFont(ofSize: 17)
        choosegoodsClassLabel.textColor = UIColor.hex(hexString: "#CCCCCC")
        choosegoodsClassLabel.textAlignment = .right

        self.addSubview(choosegoodsClassLabel)
        choosegoodsClassLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsClassLabel).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-34)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(classLine.snp.top)
        }
        goodsArrowRight.image = UIImage.init(named: "right_arrow")
        self.addSubview(goodsArrowRight)
        goodsArrowRight.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(choosegoodsClassLabel.snp.right).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.width.equalTo(8)
            ConstraintMaker.top.equalTo(classLine.snp.top).offset(15)
        }


    }

    @objc func tapChooseGoodsSLTAction() {
        delegate?.tapChooseGoodsSLTAction()
    }

    @objc func tapChooseGoodsPicAction() {
        delegate?.tapChooseGoodsPicAction()
    }
}


