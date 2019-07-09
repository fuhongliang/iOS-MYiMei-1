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
    func checkLogisticNotSwitch()
}

class USettingDeliveryView: BaseView {
    //MARK:声明各种控件变量
    weak var delegate: USettingDeliveryViewDelegate?
    
    var stackView = UIStackView()
    
    //MARK:快递配送
    var courierDeliveryLayer = UIView()
    
    var courierDeliveryLabel = UILabel()
    var courierSwitch = UISwitch()
    var courierDeliveryLine = UIView()
    
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
    //MARK:无需物流
    var logisticNotLayer = UIView()
    
    var logisticNotLabel = UILabel()
    var logisticNotSwitch = UISwitch()
    var logisticNotLine = UIView()
    //MARK:无需物流-商家留言
    var logisticNotMessageLayer = UIView()
    
    var logisticNotMessageLabel = UILabel()
    var logisticNotMessageTF = KMPlaceholderTextView()
    
    
    func configUI(){
        
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        
        //MARK:快递配送
        courierDeliveryLayer.backgroundColor = UIColor.white
        self.addSubview(courierDeliveryLayer)
        courierDeliveryLayer.snp.makeConstraints { (ConstraintMaker) in
            
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.left.right.equalToSuperview()
            
        }
        courierDeliveryLabel.text = "快递配送"
        courierDeliveryLabel.textColor = UIColor.black
        courierDeliveryLabel.font = UIFont.systemFont(ofSize: 17)
        courierDeliveryLayer.addSubview(courierDeliveryLabel)
        courierDeliveryLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(16)
        }
        
        courierSwitch.layer.cornerRadius = 15
        courierSwitch.isOn = true
        courierSwitch.backgroundColor = UIColor.hex(hexString: "#CDCDCD")
        courierSwitch.onTintColor = UIColor.hex(hexString: "#1C98F6")
        courierSwitch.tintColor = UIColor.hex(hexString: "#CDCDCD")
        courierSwitch.thumbTintColor = UIColor.white
        courierDeliveryLayer.addSubview(courierSwitch)
        courierSwitch.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-16)
            ConstraintMaker.size.equalTo(CGSize(width:48, height:30))
        }
        courierSwitch.addTarget(self, action: #selector(checkCourierDeliverySwitch), for: UIControl.Event.valueChanged)
        
        courierDeliveryLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        courierDeliveryLayer.addSubview(courierDeliveryLine)
        courierDeliveryLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:快递公司
        courierCompanyLayer.backgroundColor = UIColor.white
        self.addSubview(courierCompanyLayer)
        courierCompanyLayer.snp.makeConstraints { (ConstraintMaker) in
            
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(courierDeliveryLayer.snp.bottom)
            ConstraintMaker.left.right.equalToSuperview()
            
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
        
        //MARK:无需物流
        logisticNotLayer.backgroundColor = UIColor.white
        self.addSubview(logisticNotLayer)
        logisticNotLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(courierLeaveMessageLayer.snp.bottom).offset(15)
            
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.left.right.equalToSuperview()

        }
        logisticNotLabel.text = "无需物流"
        logisticNotLabel.textColor = UIColor.black
        logisticNotLabel.font = UIFont.systemFont(ofSize: 17)
        logisticNotLayer.addSubview(logisticNotLabel)
        logisticNotLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(16)
        }

        logisticNotSwitch.layer.cornerRadius = 15
        logisticNotSwitch.isOn = false
        logisticNotSwitch.backgroundColor = UIColor.hex(hexString: "#CDCDCD")
        logisticNotSwitch.onTintColor = UIColor.hex(hexString: "#1C98F6")
        logisticNotSwitch.tintColor = UIColor.hex(hexString: "#CDCDCD")
        logisticNotSwitch.thumbTintColor = UIColor.white
        logisticNotLayer.addSubview(logisticNotSwitch)
        logisticNotSwitch.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-16)
            ConstraintMaker.size.equalTo(CGSize(width:48, height:30))
        }
        logisticNotSwitch.addTarget(self, action: #selector(checkLogisticNotSwitch), for: UIControl.Event.valueChanged)

        logisticNotLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        logisticNotLayer.addSubview(logisticNotLine)
        logisticNotLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
//
        //MARK:无需配送-商家留言
        logisticNotMessageLayer.backgroundColor = UIColor.white
        self.addSubview(logisticNotMessageLayer)
        logisticNotMessageLayer.isHidden = true
        logisticNotMessageLayer.snp.makeConstraints { (ConstraintMaker) in

            ConstraintMaker.height.equalTo(120)
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalTo(logisticNotLayer.snp.bottom)

        }

        logisticNotMessageLabel.text = "商家留言"
        logisticNotMessageLabel.textColor = UIColor.black
        logisticNotMessageLabel.font = UIFont.systemFont(ofSize: 17)
        logisticNotMessageLayer.addSubview(logisticNotMessageLabel)
        logisticNotMessageLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalToSuperview().offset(14)
            ConstraintMaker.left.equalToSuperview().offset(16)
        }


        logisticNotMessageTF.placeholder = "请输入留言"
        logisticNotMessageTF.textColor = UIColor.black
        logisticNotMessageTF.font = UIFont.systemFont(ofSize: 17)
        logisticNotMessageTF.placeholderFont = UIFont.systemFont(ofSize: 17)
        logisticNotMessageLayer.addSubview(logisticNotMessageTF)
        logisticNotMessageTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(12)
            ConstraintMaker.right.equalToSuperview().offset(-16)
            ConstraintMaker.top.equalTo(logisticNotMessageLabel.snp.bottom)
            ConstraintMaker.height.equalTo(70)

        }

    }
    
    @objc func checkCourierDeliverySwitch() {
        delegate?.checkCourierDeliverySwitch()
    }
    
    @objc func checkLogisticNotSwitch() {
        delegate?.checkLogisticNotSwitch()
    }
}
