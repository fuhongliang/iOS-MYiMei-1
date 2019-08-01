//
//  UWeChatWithdrawController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/30.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UWeChatWithdrawController: UBaseViewController {
    
    let mWeChatWithdrawView = UWeChatWithdrawView()
    
    override func configUI() {
        mWeChatWithdrawView.setView()
        self.view.addSubview(mWeChatWithdrawView)
        self.view.backgroundColor = UIColor.white
        
        mWeChatWithdrawView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
