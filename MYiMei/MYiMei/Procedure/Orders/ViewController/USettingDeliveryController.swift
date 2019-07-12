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
    
    let service = APIOrderServices()
    
    var orderId = 0
  
    func setOrderId(){
        
    }
    
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
        //MARK:请求按钮
        let express = settingDelivery.courierCompanyChoiceLabel.text ?? ""
        let expressNo = settingDelivery.courierOrderNoLabel.text ?? ""
        let words = settingDelivery.courierLeaveMessageTF.text ?? ""
        service.deliveryGoods(order_id: orderId, is_express: 1, express: express, express_no: expressNo, words: words, {
            print("发货成功")
            showHUDInView(text: "发货成功", inView: self.view)
        }) { (APIErrorModel) in
            print("发货失败")
            showHUDInView(text: "发货失败", inView: self.view)
        }
    }
}

extension USettingDeliveryController: USettingDeliveryViewDelegate {
    func checkCourierDeliverySwitch() {
        chooseCourierDelivery()
    }
}
