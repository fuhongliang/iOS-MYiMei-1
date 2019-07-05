//
//  UOrderDetailsViewController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/4.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
class UOrderDetailsViewController: UBaseViewController {
    
    let mOrderDetailsViewController = UOrderDetailsView()
    
    override func configUI() {
        mOrderDetailsViewController.setView()
        self.view.addSubview(mOrderDetailsViewController)
        self.view.backgroundColor = UIColor.white
        mOrderDetailsViewController.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
