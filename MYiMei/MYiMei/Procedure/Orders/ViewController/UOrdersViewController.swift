//
//  UOrdersViewController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//


import UIKit

class UOrdersViewController: UBaseViewController {

    let mOrderCell = UOderCell()
    
    override func configUI() {
        mOrderCell.setView()
        self.view.addSubview(mOrderCell)
         self.view.backgroundColor = UIColor.white
        mOrderCell.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}

