//
//  USettingController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/13.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class USettingController: UBaseViewController {
    
    let mSettingController = UAboutUsView()
    
    override func configUI() {
//        mSettingController.setView()
        self.view.addSubview(mSettingController)
        self.view.backgroundColor = UIColor.white
        
        mSettingController.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
