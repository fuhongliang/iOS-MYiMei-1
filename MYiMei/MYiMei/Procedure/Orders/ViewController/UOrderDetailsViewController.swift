//
//  UOrderDetailsViewController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/4.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
class UOrderDetailsViewController: UBaseViewController {
    
    let mOrderDetailsViewController = UOrderDetailsView()
    
    var orderId = 0
    
    var orderModel = Order()
    
    fileprivate let service = APIOrderServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getOrderDetail(order_id: orderId, { (OrderDetailResponseModel) in
            self.orderModel = OrderDetailResponseModel.data.order
            self.setOrderProccess()
            self.mOrderDetailsViewController.userNameLaber.text = self.orderModel.name
            self.mOrderDetailsViewController.userPhoneLaber.text = self.orderModel.mobile
            self.mOrderDetailsViewController.addressLaber.text = "地址: \(String(self.orderModel.address))"
            self.mOrderDetailsViewController.orderNumberRightLaber.text = self.orderModel.order_no
            self.mOrderDetailsViewController.orderTimeRighrLaber.text = String(self.orderModel.addtime ?? 0)
            self.mOrderDetailsViewController.payModeRightLaber.text = self.getPayType(type: self.orderModel.pay_type)
            self.mOrderDetailsViewController.freightRightLaber.text = self.orderModel.express_price
            self.mOrderDetailsViewController.orderAmountRightLaber.text = self.orderModel.total_price
            let payPrice = Int(self.orderModel.pay_price ?? "") ?? 0
            let beforPrice = Int(self.orderModel.before_update_price ?? "") ?? 0
            self.mOrderDetailsViewController.bgModifypPriceRightLaber.text = ((payPrice - beforPrice)>0 ? "加价：" : "优惠：") + "\(abs(payPrice - beforPrice))"
            self.mOrderDetailsViewController.actualAmountRightLaber.text = self.orderModel.pay_price
            self.setGoodsView()
            self.mOrderDetailsViewController.leaveCommentsRightLaber.text = self.orderModel.remark
        }) { (APIErrorModel) in

        }
    }
    
    override func configUI() {
        mOrderDetailsViewController.setView()
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        scrollView.addSubview(mOrderDetailsViewController)
        scrollView.showsVerticalScrollIndicator = false
        mOrderDetailsViewController.snp.updateConstraints { (make) -> Void in
            make.width.equalTo(screenWidth)
            make.height.equalTo(1119)
            make.top.equalTo(scrollView)
            make.leading.equalTo(scrollView)
            make.trailing.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
        }
        scrollView.contentSize = CGSize(width: screenWidth, height: 1125)
        view.addSubview(scrollView)
    }
    
    //MARK:设置商品信息
    func setGoodsView() {
//        for _ in orderModel.goodsList {
//
//        }
    }
    
    //MARK:设置进度条
    func setOrderProccess() {
        if (orderModel.is_pay == 0) {
            mOrderDetailsViewController.orderStatusLaber.text = "订单已经提交，等待卖家付款"
            setProcessOne()
        } else if (orderModel.is_send == 0){
            mOrderDetailsViewController.orderStatusLaber.text = "订单已支付成功"
            setProcessOne()
            setProcessTwo()
        } else if (orderModel.is_confirm == 0){
            mOrderDetailsViewController.orderStatusLaber.text = "订单已支付，未确认收货"
            setProcessOne()
            setProcessTwo()
            setProcessThree()
        } else if (orderModel.is_confirm == 1){
            mOrderDetailsViewController.orderStatusLaber.text = "订单已完成"
            setProcessOne()
            setProcessTwo()
            setProcessThree()
            setProcessFour()
        }
    }
    
    func setProcessOne(){
        mOrderDetailsViewController.orderPushTimeLaber.text = dateForMatter(timeString: orderModel.addtime, join: "\n")
        
    }
    
    func setProcessTwo() {
        mOrderDetailsViewController.orderPayLine.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        mOrderDetailsViewController.orderPayIcon.image = UIImage.init(named: "order_status")
        mOrderDetailsViewController.orderPayTimeLaber.text = dateForMatter(timeString: orderModel.pay_time, join: "\n")
    }
    
    func setProcessThree() {
        mOrderDetailsViewController.orderShippingLine.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        mOrderDetailsViewController.orderShippiingIcon.image = UIImage.init(named: "order_status")
        mOrderDetailsViewController.orderShippingTimeLaber.text = dateForMatter(timeString: orderModel.send_time, join: "\n")
    }
    
    func setProcessFour() {
        mOrderDetailsViewController.orderFinishIcon.image = UIImage.init(named: "order_status")
        mOrderDetailsViewController.orderFinishTimeLaber.text = dateForMatter(timeString: orderModel.confirm_time, join: "\n")
    }
    
    func getPayType(type:Int) -> String {
        if type == 1 {
            return "微信支付"
        } else if (type == 3){
            return "商城支付"
        }
        return ""
    }
    
    //MARK:设置订单中的商品列表
//    func setGoodsView() {
//
//    }
    
}
