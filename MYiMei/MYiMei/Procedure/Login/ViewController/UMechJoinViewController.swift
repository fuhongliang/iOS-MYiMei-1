//
//  UMechJoinViewController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UMechJoinViewController: UBaseViewController {
    
    let mMchJoinView = UMchJoinView()
    
    override func configUI() {
        mMchJoinView.setView()
        self.view.addSubview(mMchJoinView)
        self.view.backgroundColor = UIColor.white
        
        mMchJoinView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
