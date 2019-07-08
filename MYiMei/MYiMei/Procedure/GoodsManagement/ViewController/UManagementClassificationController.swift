//
//  UManagementClassificationController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
class UManagementClassificationController: UBaseViewController {
    
    let mManagementClassificationController = UManagementClassificationCell()
    
    override func configUI() {
        mManagementClassificationController.setView()
        self.view.addSubview(mManagementClassificationController)
        self.view.backgroundColor = UIColor.white
        mManagementClassificationController.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
