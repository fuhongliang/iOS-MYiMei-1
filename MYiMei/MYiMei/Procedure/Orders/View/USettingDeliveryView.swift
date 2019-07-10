//
//  USettingDelivery.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/8.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import KMPlaceholderTextView

protocol USettingDeliveryViewDelegate: AnyObject {
    func checkCourierDeliverySwitch()
}

class USettingDeliveryView: BaseView {
    //MARK:声明各种控件变量
    weak var delegate: USettingDeliveryViewDelegate?

    //MARK:快递公司
    var courierCompanyLayer = UIView()
    
    var courierCompanyLabel = UILabel()
    var courierCompanyChoiceLabel = UILabel()
    var courierCompanyArrowImg = UIImageView()
    var courierCompanyLine = UIView()
    
    //MARK:快递单号
    var courierOrderNoLayer = UIView()
    
    var courierOrderNoLabel = UILabel()
    var courierOrderNoTF = UITextField()
    var courierOrderNoLine = UIView()
    //MARK:快递配送-商家留言
    var courierLeaveMessageLayer = UIView()
    
    var courierLeaveMessageLabel = UILabel()
    var courierLeaveMessageTF = KMPlaceholderTextView()
//    //MARK:无需物流
    
    func configUI(){
        
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
  
        //MARK:快递公司
        courierCompanyLayer.backgroundColor = UIColor.white
        self.addSubview(courierCompanyLayer)
        courierCompanyLayer.snp.makeConstraints { (ConstraintMaker) in
            
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.left.right.equalToSuperview()
            
        }
        courierCompanyLabel.text = "快递公司"
        courierCompanyLabel.textColor = UIColor.black
        courierCompanyLabel.font = UIFont.systemFont(ofSize: 17)
        courierCompanyLayer.addSubview(courierCompanyLabel)
        courierCompanyLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(16)
        }
        
        courierCompanyArrowImg.image = UIImage.init(named: "right_arrow")
        courierCompanyLayer.addSubview(courierCompanyArrowImg)
        courierCompanyArrowImg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalTo(9)
            ConstraintMaker.height.equalTo(14)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        courierCompanyChoiceLabel.text = "请选择快递公司"
        courierCompanyChoiceLabel.textColor = UIColor.hex(hexString: "#CCCCCC")
        courierCompanyChoiceLabel.font = UIFont.systemFont(ofSize: 17)
        courierCompanyLayer.addSubview(courierCompanyChoiceLabel)
        courierCompanyChoiceLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalTo(courierCompanyArrowImg.snp.left).offset(-13)
        }
        
        courierCompanyLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        courierCompanyLayer.addSubview(courierCompanyLine)
        courierCompanyLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:快递单号
        courierOrderNoLayer.backgroundColor = UIColor.white
        self.addSubview(courierOrderNoLayer)
        courierOrderNoLayer.snp.makeConstraints { (ConstraintMaker) in
            
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalTo(courierCompanyLayer.snp.bottom)
            
        }
        courierOrderNoLabel.text = "快递单号"
        courierOrderNoLabel.textColor = UIColor.black
        courierOrderNoLabel.font = UIFont.systemFont(ofSize: 17)
        courierOrderNoLayer.addSubview(courierOrderNoLabel)
        courierOrderNoLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(16)
        }
        
        courierOrderNoTF.placeholder = "请输入单号"
        courierOrderNoTF.textAlignment = .right
        courierOrderNoTF.textColor = UIColor.black
        courierOrderNoLayer.addSubview(courierOrderNoTF)
        courierOrderNoTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.height.equalToSuperview()
        }
       
        courierOrderNoLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        courierOrderNoLayer.addSubview(courierOrderNoLine)
        courierOrderNoLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:快递配送-商家留言
        courierLeaveMessageLayer.backgroundColor = UIColor.white
        self.addSubview(courierLeaveMessageLayer)
        courierLeaveMessageLayer.snp.makeConstraints { (ConstraintMaker) in
            
            ConstraintMaker.height.equalTo(120)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalTo(courierOrderNoLayer.snp.bottom)
            
        }
        
        courierLeaveMessageLabel.text = "商家留言"
        courierLeaveMessageLabel.textColor = UIColor.black
        courierLeaveMessageLabel.font = UIFont.systemFont(ofSize: 17)
        courierLeaveMessageLayer.addSubview(courierLeaveMessageLabel)
        courierLeaveMessageLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(14)
            ConstraintMaker.left.equalToSuperview().offset(16)
        }
        
        courierLeaveMessageTF.placeholder = "请输入留言"
        courierLeaveMessageTF.textColor = UIColor.black
        courierLeaveMessageTF.font = UIFont.systemFont(ofSize: 17)
        courierLeaveMessageTF.placeholderFont = UIFont.systemFont(ofSize: 17)
        courierLeaveMessageLayer.addSubview(courierLeaveMessageTF)
        courierLeaveMessageTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(12)
            ConstraintMaker.right.equalToSuperview().offset(-16)
            ConstraintMaker.top.equalTo(courierLeaveMessageLabel.snp.bottom)
            ConstraintMaker.height.equalTo(70)

        }
 

    }
    
    @objc func checkCourierDeliverySwitch() {
        delegate?.checkCourierDeliverySwitch()
    }
}
