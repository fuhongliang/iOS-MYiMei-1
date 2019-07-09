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
    
    var choose:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configUI() {
        settingDelivery.configUI()
        settingDelivery.delegate = self
        view.addSubview(settingDelivery)
        settingDelivery.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    func chooseCourierDelivery() {
        if (!settingDelivery.courierSwitch.isOn) {
            settingDelivery.logisticNotSwitch.isOn = true
            settingDelivery.logisticNotMessageLayer.isHidden = false
//            settingDelivery.courierOrderNoLayer.isHidden = true
        }else{
            settingDelivery.logisticNotSwitch.isOn = false
            settingDelivery.logisticNotMessageLayer.isHidden = true
//            settingDelivery.courierOrderNoLayer.isHidden = false
        }
        print(settingDelivery.courierSwitch.isOn)
    }
    
    func chooseLogisticNot() {
        if (!settingDelivery.logisticNotSwitch.isOn) {
            settingDelivery.courierSwitch.isOn = true
        }else{
            settingDelivery.courierSwitch.isOn = false
        }
        
    }
}

extension USettingDeliveryController: USettingDeliveryViewDelegate {
    func checkCourierDeliverySwitch() {
        chooseCourierDelivery()
    }
    func checkLogisticNotSwitch() {
        chooseLogisticNot()
    }
}
