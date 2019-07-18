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
    var isRequestOrderDetail = false
    
    fileprivate let service = APIOrderServices()
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tw.separatorStyle = UITableViewCell.SeparatorStyle.none
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: UOrderDetailSectionTitleCell.self)
        tw.register(cellType: UOrderDetailNameAddressCell.self)
        tw.register(cellType: UOrderDetailInfoCell.self)
        tw.register(cellType: UOrderDetailProcessCell.self)
        tw.register(cellType: UOrderDetailGoodsCell.self)
//        tw.register(cellType: UOrderDetailConfirmBtnCell.self)
        return tw
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getOrderDetail(order_id: orderId, { (OrderDetailResponseModel) in
            self.orderModel = OrderDetailResponseModel.data.order
            self.isRequestOrderDetail = true
            self.tableView.reloadData()
//            self.setOrderProccess()
//            self.mOrderDetailsViewController.userNameLaber.text = self.orderModel.name
//            self.mOrderDetailsViewController.userPhoneLaber.text = self.orderModel.mobile
//            self.mOrderDetailsViewController.addressLaber.text = "地址: \(String(self.orderModel.address))"
//            self.mOrderDetailsViewController.orderNumberRightLaber.text = self.orderModel.order_no
//            self.mOrderDetailsViewController.orderTimeRighrLaber.text = String(self.orderModel.addtime ?? 0)
//            self.mOrderDetailsViewController.payModeRightLaber.text = self.getPayType(type: self.orderModel.pay_type)
//            self.mOrderDetailsViewController.freightRightLaber.text = self.orderModel.express_price
//            self.mOrderDetailsViewController.orderAmountRightLaber.text = self.orderModel.total_price
//            let payPrice = Int(self.orderModel.pay_price ?? "") ?? 0
//            let beforPrice = Int(self.orderModel.before_update_price ?? "") ?? 0
//            self.mOrderDetailsViewController.bgModifypPriceRightLaber.text = ((payPrice - beforPrice)>0 ? "加价：" : "优惠：") + "\(abs(payPrice - beforPrice))"
//            self.mOrderDetailsViewController.actualAmountRightLaber.text = self.orderModel.pay_price
////            self.setGoodsView()
//            self.mOrderDetailsViewController.leaveCommentsRightLaber.text = self.orderModel.remark
        }) { (APIErrorModel) in

        }
    }
    
    override func configUI() {
        mOrderDetailsViewController.setView()
        mOrderDetailsViewController.addSubview(tableView)
        view.addSubview(mOrderDetailsViewController)
        mOrderDetailsViewController.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        view.addSubview(tableView)
        tableView.backgroundColor = nil
        tableView.backgroundView = UIView()
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 55, left: 15, bottom: 0, right: 15))

        }

    }
    
    //MARK:设置进度条
    func setOrderProccess(view : UOrderDetailProcessCell) {
        if (getProgress() == 0) {
            mOrderDetailsViewController.orderStatusLaber.text = "订单已经提交，等待卖家付款"
            setProcessOne(cell: view)
        } else if (getProgress() == 1){
            mOrderDetailsViewController.orderStatusLaber.text = "订单已支付成功"
            setProcessOne(cell: view)
            setProcessTwo(cell: view)
        } else if (getProgress() == 2){
            mOrderDetailsViewController.orderStatusLaber.text = "订单已支付，未确认收货"
            setProcessOne(cell: view)
            setProcessTwo(cell: view)
            setProcessThree(cell: view)
        } else if (getProgress() == 3){
            mOrderDetailsViewController.orderStatusLaber.text = "订单已完成"
            setProcessOne(cell: view)
            setProcessTwo(cell: view)
            setProcessThree(cell: view)
            setProcessFour(cell: view)
        }
    }
    
    func setProcessOne(cell: UOrderDetailProcessCell){
        cell.orderPushTimeLabel.text = dateForMatter(timeString: orderModel.addtime, join: "\n")
    }
    
    func setProcessTwo(cell: UOrderDetailProcessCell) {
        cell.orderPayLine.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        cell.orderPayIcon.image = UIImage.init(named: "order_status")
        cell.orderPayTimeLabel.text = dateForMatter(timeString: orderModel.pay_time, join: "\n")
    }
    
    func setProcessThree(cell: UOrderDetailProcessCell) {
        cell.orderShippingLine.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        cell.orderShippingIcon.image = UIImage.init(named: "order_status")
        cell.orderShippingTimeLabel.text = dateForMatter(timeString: orderModel.send_time, join: "\n")
    }
    
    func setProcessFour(cell: UOrderDetailProcessCell) {
        cell.orderFinishIcon.image = UIImage.init(named: "order_status")
        cell.orderFinishTimeLabel.text = dateForMatter(timeString: orderModel.confirm_time, join: "\n")
    }
    
    func getPayType(type:Int) -> String {
        if type == 1 {
            return "微信支付"
        } else if (type == 3){
            return "商城支付"
        }
        return "暂无"
    }
    
    //获取当前的进度 用数值表示
    func getProgress() -> Int {
        if (orderModel.is_pay == 0) {
            return 0
        } else if (orderModel.is_send == 0){
            return 1
        } else if (orderModel.is_confirm == 0){
            return 2
        } else if (orderModel.is_confirm == 1){
            return 3
        }
        return 0
    }
    
    /*
     MARK:获取InfoCell removeItem后对应的高度
     通过判断当前的cell位置 结合当前订单进度 返回对应的cell高度
     */
    func getInfoCellHeight(cellRow:Int) -> CGFloat {
        if(getProgress()==0){
            if (cellRow == 2){//未支付订单->三个item
                return 86
            } else if (cellRow == 3){//未支付订单->四个item
                return 111
            }
        } else if (getProgress() == 1){
            if (cellRow == 2){//已支付未发货的订单->四个item
                return 111
            } else if (cellRow == 3){///已支付未发货的订单->两个item
                return 60
            }
        } else if (getProgress() == 3 || getProgress() == 4){
            if (cellRow == 2 || cellRow == 4){//已发货和已收货一样 -> 头尾两个item
                return 60
            } else if (cellRow == 3){//已发货和已收货一样 -> 中间四个item
                return 111
            }
        }
        return 0
    }

    
}

extension UOrderDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        if !isRequestOrderDetail {
            return 0 //如果请求未完成则不显示
        }
        return 3
    }
    
    //MARK:cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !isRequestOrderDetail {
            return 0 //如果请求未完成则不显示
        }
        if (indexPath.section == 0) {
            return 113 //订单进度条
        } else if (indexPath.section == 1){
            if (indexPath.row == 0){
                return 42 //订单详情
            } else if (indexPath.row == 1){
                return 72 //收货人&电话&地址
            } else {
                //判断不同进度下订单信息的cell高度
                return self.getInfoCellHeight(cellRow: indexPath.row)
            }
        } else if (indexPath.section == 2){
            if (indexPath.row == 0){
                return 42 //商品详情
            } else if (indexPath.row == (orderModel.goodsList.count + 1)){
                //判断商品列表中有多少商品(这里返回最后一个买家留言的高度)
                return 43
            } else {
                return 90
            }
        }
        
        return 44 //确定按钮的高度
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isRequestOrderDetail {
            return 0 //如果请求未完成则不显示
        }
        if (section == 0 || section == 3) {
            return 1 //订单进度 一个cell 注:3是原本的Button
        } else if (section == 1) {
            if (getProgress() == 2 || getProgress() == 3) {
                return 5 //订单详情 23进度下5个cell
            } else {
                return 4//订单详情 01进度下4个cell
            }
        } else if (section == 2){
            if (isRequestOrderDetail){
                return orderModel.goodsList.count + 2 //商品信息 头尾两个加上商品的数量
            } else {
                return 0
            }
        }
        return 0
    }
    
    //MARK:每个section的头部的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    
    //MARK:cell的Footer高度
    //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        return 10
    //    }
    //
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //
    //        let tipView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
    //
    //        return tipView
    //    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let tipView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
        return nil
    }

    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            return getProcessCell(index: indexPath)
        } else if (indexPath.section == 1 ){
            if (indexPath.row == 0){
                return getSectionTitleCell(index: indexPath, title: "订单详情")
            } else if (indexPath.row == 1){
                return getNameAddressCell(index: indexPath)
            } else {
                //这里判断订单状态 remove掉多余的行
                var num = 4
                var colorIndex = 0
                var colorArray = [UIColor]()
                var labelOne = ""
                var labelTwo = ""
                var labelThree = ""
                var labelFour = ""
                var labelOneValue = ""
                var labelTwoValue = ""
                var labelThreeValue = ""
                var labelFourValue = ""
                if (isRequestOrderDetail){
                    
                    if (getProgress() == 0){
                        if(indexPath.row == 2){
                            num = 3
                            labelOne = "订单编号"
                            labelOneValue = orderModel.order_no
                            labelTwo = "订单时间"
                            labelTwoValue = dateForMatter(timeString: orderModel.addtime, join: " ")
                            labelThree = "支付方式"
                            labelThreeValue = getPayType(type: orderModel.pay_type)
                        } else if(indexPath.row == 3){
                            num = 4
                            colorIndex = 1 << 3
                            colorArray = [UIColor.hex(hexString: "#FF4444")]
                            labelOne = "运费"
                            labelOneValue = orderModel.express_price + "元"
                            labelTwo = "下单金额"
                            labelTwoValue = orderModel.total_price + "元"
                            
                            let payPrice = Int(orderModel.pay_price ?? "") ?? 0
                            let beforPrice = Int(orderModel.before_update_price ?? "") ?? 0
                            labelThree = "后台改价"
                            labelThreeValue = ((payPrice - beforPrice)>0 ? "加价：" : "优惠：") + "\(abs(payPrice - beforPrice))元"
                            labelFour = "实付金额"
                            labelFourValue = orderModel.pay_price + "元"
                        }
                    } else if (getProgress() == 1){
                        if(indexPath.row == 2){
                            num = 4
                            labelOne = "订单编号"
                            labelOneValue = orderModel.order_no
                            labelTwo = "订单时间"
                            labelTwoValue = dateForMatter(timeString: orderModel.addtime, join: " ")
                            labelThree = "支付方式"
                            labelThreeValue = getPayType(type: orderModel.pay_type)
                            labelFour = "付款时间"
                            labelFourValue = dateForMatter(timeString: orderModel.pay_time, join: " ")
                        } else if(indexPath.row == 3){
                            num = 2
                            colorIndex = 1 << 1
                            colorArray = [UIColor.hex(hexString: "#FF4444")]
                            labelOne = "运费"
                            labelOneValue = orderModel.express_price + "元"
                            labelTwo = "实付金额"
                            labelTwoValue = orderModel.pay_price + "元"
                        }
                    } else if (getProgress() == 2 || getProgress() == 3){
                        if(indexPath.row == 2){
                            num = 2
                            labelOne = "快递公司"
                            labelOneValue = orderModel.express
                            labelTwo = "快递单号"
                            labelTwoValue = orderModel.express_no
                        } else if(indexPath.row == 3){
                            num = 4
                            labelOne = "订单编号"
                            labelOneValue = orderModel.order_no
                            labelTwo = "订单时间"
                            labelTwoValue = dateForMatter(timeString: orderModel.addtime, join: " ")
                            labelThree = "支付方式"
                            labelThreeValue = getPayType(type: orderModel.pay_type)
                            labelFour = "付款时间"
                            labelFourValue = dateForMatter(timeString: orderModel.pay_time, join: " ")
                        } else if(indexPath.row == 4){
                            num = 2
                            colorIndex = 1 << 1
                            colorArray = [UIColor.hex(hexString: "#FF4444")]
                            labelOne = "运费"
                            labelOneValue = orderModel.express_price + "元"
                            labelFour = "实付金额"
                            labelFourValue = orderModel.pay_price + "元"
                        }
                    }
                    
                }
                return getInfoCell(index: indexPath, num: num, colorIndex: colorIndex, colorArray: colorArray, labelOne: labelOne, labelTwo: labelTwo, labelThree: labelThree, labelFour: labelFour, labelOneValue: labelOneValue, labelTwoValue: labelTwoValue, labelThreeValue: labelThreeValue, labelFourValue: labelFourValue)
            }
        } else {
            if (indexPath.row == 0){
                return getSectionTitleCell(index: indexPath, title: "商品信息")
            } else if (indexPath.row == orderModel.goodsList.count + 1){
                //这里只保留一行，并且把内容文字的方向调整为left
                return getInfoCell(index: indexPath, num: 1, colorArray: [], labelOne: "买家留言：", labelOneValue: orderModel.remark, textAlignment: .left)
            } else {
                //商品cell
                return getGoodsCell(index: indexPath)
            }
        }
        
    }
    
    
    //MARK:footerView即将显示的时候的回调
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }

    
    //MARK:每个cell即将显示时回调  在这里处理section的圆角
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cornerRadius: CGFloat = 6.0
        cell.backgroundColor = UIColor.clear
        
        let layer = CAShapeLayer()
        let backgroundLayer = CAShapeLayer()
        let pathRef = CGMutablePath()
        let bounds = cell.bounds;
        
        let numberOfRows = self.tableView.numberOfRows(inSection: indexPath.section)
        
        var needSeparator = false
        if (indexPath.row == 0 && numberOfRows == 1) {
            pathRef.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
        }else if (indexPath.row == 0) {
            pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
            pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY), tangent2End: CGPoint(x: bounds.midX, y: bounds.minY), radius: cornerRadius)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
            pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
            needSeparator = true;
        } else if indexPath.row == (numberOfRows-1) {
            pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
            pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY), radius: cornerRadius)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
            pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        } else {
            pathRef.addRect(bounds)
            needSeparator = true
        }
        
        layer.path = pathRef
        backgroundLayer.path = pathRef
        layer.fillColor = UIColor.white.cgColor
        
        if (needSeparator) {
            let lineLayer = CALayer()
            let lineHeight = /*(1.0 / UIScreen.main.scale)*/ CGFloat(0.5)
            lineLayer.frame = CGRect(x: bounds.minX + 15, y: bounds.size.height-lineHeight, width: bounds.size.width - 30, height: lineHeight)
            lineLayer.backgroundColor = self.tableView.separatorColor?.cgColor
            
            layer.addSublayer(lineLayer)
        }
        
        let roundView = UIView(frame: bounds)
        roundView.layer.insertSublayer(layer, at: 0)
        roundView.backgroundColor = UIColor.clear
        cell.backgroundView = roundView
        
    }
    
    //MARK:返回进度条的cell
    func getProcessCell(index: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(for: index, cellType: UOrderDetailProcessCell.self)
        guard !isRequestOrderDetail else {
            setOrderProccess(view: cell)
            return cell
        }
        return cell
    }
    
    //MARK:返回标题的cell （订单详情、商品信息）
    func getSectionTitleCell(index:IndexPath,title: String) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(for: index, cellType: UOrderDetailSectionTitleCell.self)
        guard !isRequestOrderDetail else {
            cell.sectionCellTitle.text = title
            return cell
        }
        return cell
    }
    
    //MARK:返回订单的收货人名字、电话、地址的cell
    func getNameAddressCell(index:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: index, cellType: UOrderDetailNameAddressCell.self)
        guard !isRequestOrderDetail else {
            cell.userNameLabel.text = orderModel.name
            cell.userPhoneLabel.text = orderModel.mobile
            cell.addressLabel.text = "地址：" + orderModel.address
            return cell
        }
        return cell
    }
    
    /*
     MARK:返回订单有四个显示文字的cell
     num:显示的数量
     colorIndex:需要改变颜色的item的索引值(可多选 1，2，3，4)
     colorArray:需要改变的颜色数组(可根据num 和 colorIndex的索引变化 例：num为2 则colorArray的count最大只能为2)
     labelOne:第一个的item文字说明
     labelTwo:第二个的item文字说明
     labelThree:第三个的item文字说明
     labelFour:第四个的item文字说明
     */
    func getInfoCell(index:IndexPath, num:Int = 4, colorIndex:Int = 0, colorArray:[UIColor]?, labelOne:String = "订单编号", labelTwo:String = "订单时间", labelThree:String = "支付方式", labelFour:String = "付款时间", labelOneValue:String = "订单编号", labelTwoValue:String = "订单时间", labelThreeValue:String = "支付方式", labelFourValue:String = "付款时间",textAlignment:NSTextAlignment = NSTextAlignment.right) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: index, cellType: UOrderDetailInfoCell.self)
        guard !isRequestOrderDetail else {
            cell.freightLeftLaber.text = labelOne
            cell.freightRightLaber.text = labelOneValue
            cell.freightRightLaber.textAlignment = textAlignment
            
            cell.orderAmountLeftLaber.text = labelTwo
            cell.orderAmountRightLaber.text = labelTwoValue
            cell.orderAmountRightLaber.textAlignment = textAlignment
            
            cell.bgModifypPriceLeftLaber.text = labelThree
            cell.bgModifypPriceRightLaber.text = labelThreeValue
            cell.bgModifypPriceRightLaber.textAlignment = textAlignment
            
            cell.actualAmountLeftLaber.text = labelFour
            cell.actualAmountRightLaber.text = labelFourValue
            cell.actualAmountRightLaber.textAlignment = textAlignment
            
            if (colorArray?.count != 0) {
                if (colorIndex & 1 > 0) {
                    cell.freightRightLaber.textColor = colorArray?[(colorArray?.count ?? 1)-1]
                }
                if ((colorIndex >> 1) & 1 > 0){
                    cell.orderAmountRightLaber.textColor = colorArray?[(colorArray?.count ?? 1)-1]
                }
                if ((colorIndex >> 2) & 1 > 0){
                    cell.bgModifypPriceRightLaber.textColor = colorArray?[(colorArray?.count ?? 1)-1]
                }
                if ((colorIndex >> 3) & 1 > 0){
                    cell.actualAmountRightLaber.textColor = colorArray?[(colorArray?.count ?? 1)-1]
                }
            }
            switch num {
                case 1:
                    cell.actualAmountLayer.removeFromSuperview()
                    cell.bgModifyPriceLayer.removeFromSuperview()
                    cell.orderAmountLayer.removeFromSuperview()
//                    cell.actualAmountLayer.isHidden = true
//                    cell.bgModifyPriceLayer.isHidden = true
//                    cell.orderAmountLayer.isHidden = true
                    break
                case 2:
                    cell.actualAmountLayer.removeFromSuperview()
                    cell.bgModifyPriceLayer.removeFromSuperview()
                    
//                    cell.actualAmountLayer.isHidden = true
//                    cell.bgModifyPriceLayer.isHidden = true
                    break
                case 3:
                    cell.actualAmountLayer.removeFromSuperview()
                    
//                    cell.actualAmountLayer.isHidden = true
                    break
                default:
                    break
            }
            
            return cell
        }
        return cell
    }
    
    //MARK:返回商品的cell
    func getGoodsCell(index:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: index, cellType: UOrderDetailGoodsCell.self)
        guard !isRequestOrderDetail else {
            let url = URL(string: orderModel.goodsList[index.row-1].pic)
            cell.commodityIcon.kf.setImage(with: url)
            cell.commodityNameLaber.text = orderModel.goodsList[index.row-1].name
            var specification = ""
            
            for item in orderModel.goodsList[index.row-1].attr {
                specification += item.attr_group_name + ":" + item.attr_name
            }
            cell.commoditySpecificationLaber.text = specification
            cell.commodityPriceLaber.text = "￥" + orderModel.goodsList[index.row-1].total_price
            cell.commodityNumberLaber.text = "x" + String(orderModel.goodsList[index.row-1].num)
            return cell
        }
        return cell
    }
    
}
