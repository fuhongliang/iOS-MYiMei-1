//
//  UMessageManagementCellView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/16.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UMessageManagementCellView: BaseView {
    //背景
    var whiteBg = UIImageView()
    //标题
    var title = UILabel()
    //内容
    var content = UILabel()
    func setView() {
        whiteBg.backgroundColor = UIColor.white
        self.addSubview(whiteBg)
        whiteBg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(66)
        }
        title.text = "新订单"
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(title)
        title.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(whiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(whiteBg.snp.top).offset(15)
        }
        content.text = "显示内容显示内容"
        content.textColor = UIColor.hex(hexString: "#999999")
        content.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(content)
        content.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(whiteBg.snp.left).offset(15)
            ConstraintMaker.top.equalTo(title.snp.bottom).offset(10)
            ConstraintMaker.right.equalTo(whiteBg.snp.right).offset(-15)
        }
    }
}
