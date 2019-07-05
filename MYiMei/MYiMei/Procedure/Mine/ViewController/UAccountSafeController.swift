//
//  UAccountSafeController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/3.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UAccountSafeController: UBaseViewController{
    
    let accountSafeView = UAccountSafeView()
    
    var title：String = "账号与安全"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountSafeView.configUI()
        self.view.addSubview(accountSafeView)
        accountSafeView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }

}
