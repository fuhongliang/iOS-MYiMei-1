//
//  RichEditorViewController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import RichEditorView

let htmlhead =  "<!DOCTYPE html>" +
    "<html>" +
    "<head>" +
    "<meta charset=\"UTF-8\">" +
    "<style type=\"text/css\">" +
    "html{margin:0;padding:0;}" +
    "body {" +
    "margin: 0;" +
    "padding: 0;" +
    "}" +
    "img{" +
    "width: 100%;" +
    "height: auto;" +
    "display: block;" +
    "margin-left: auto;" +
    "margin-right: auto;" +
    "}" +
    "</style>" +
"</head>"


class RichEditorViewController: UBaseViewController {

    var goodsDescrView = UGoodsDescrView()

    //var htmlTextView: UITextView!
    var htmlText = String()

    lazy var toolbar: RichEditorToolbar = {
        let toolbar = RichEditorToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))
        let all: [RichEditorDefaultOption] = [
            .bold,.header(1), .header(2), .header(3),
            .unorderedList,
            .alignLeft, .alignCenter, .alignRight,.image
        ]
        toolbar.options = all

        return toolbar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        goodsDescrView.configUI()
        
        self.view.addSubview(goodsDescrView)

        goodsDescrView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview().offset(screenHeight/2)
        }

        goodsDescrView.editorView.delegate = self
        goodsDescrView.editorView.inputAccessoryView = toolbar
        goodsDescrView.editorView.placeholder = "请输入商品描述"
        if(!getGoodsDescr().isEmpty){
            htmlText = getGoodsDescr()
            goodsDescrView.editorView.html = htmlhead + htmlText
        }
        toolbar.delegate = self
        toolbar.editor = goodsDescrView.editorView
        let btnItem = UIBarButtonItem.init(title: "保存", style: .plain, target: self, action: #selector(tapAddDescrAction))
        btnItem.tintColor = UIColor.white
        btnItem.width = 60
        navigationItem.rightBarButtonItem = btnItem
    }

    //MARK:保存商品描述
    @objc func tapAddDescrAction() {
        saveGoodsDescr(goodsDescr: htmlText)
        pressBack()
    }

}

extension RichEditorViewController: RichEditorDelegate {

    func richEditor(_ editor: RichEditorView, contentDidChange content: String) {
        if content.isEmpty {
           htmlText = ""
        } else {
           htmlText = content
        }
    }

}

extension RichEditorViewController: RichEditorToolbarDelegate {

    fileprivate func randomColor() -> UIColor {
        let colors: [UIColor] = [
            .red,
            .orange,
            .yellow,
            .green,
            .blue,
            .purple
        ]

        let color = colors[Int(arc4random_uniform(UInt32(colors.count)))]
        return color
    }

    func richEditorToolbarChangeTextColor(_ toolbar: RichEditorToolbar) {
        let color = randomColor()
        toolbar.editor?.setTextColor(color)
    }

    func richEditorToolbarChangeBackgroundColor(_ toolbar: RichEditorToolbar) {
        let color = randomColor()
        toolbar.editor?.setTextBackgroundColor(color)
    }

    func richEditorToolbarInsertImage(_ toolbar: RichEditorToolbar) {
        toolbar.editor?.insertImage("https://gravatar.com/avatar/696cf5da599733261059de06c4d1fe22", alt: "Gravatar")
    }

    func richEditorToolbarInsertLink(_ toolbar: RichEditorToolbar) {
        // Can only add links to selected text, so make sure there is a range selection first
        if toolbar.editor?.hasRangeSelection == true {
            toolbar.editor?.insertLink("http://github.com/cjwirth/RichEditorView", title: "Github Link")
        }
    }
}
