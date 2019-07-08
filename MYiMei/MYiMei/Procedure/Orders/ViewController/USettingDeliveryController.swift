//
//  USettingDeliveryController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/8.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class USettingDeliveryController: UBaseViewController {
    
    let settingDelivery = USettingDeliveryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingDelivery.configUI()
        view.addSubview(settingDelivery)
        settingDelivery.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
}
