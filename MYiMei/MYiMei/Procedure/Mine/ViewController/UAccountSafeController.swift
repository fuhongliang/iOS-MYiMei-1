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
        
        view.addSubview(accountSafeView)
        accountSafeView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges).priority(.low)
            $0.top.equalToSuperview()
        }
    }
    

}
