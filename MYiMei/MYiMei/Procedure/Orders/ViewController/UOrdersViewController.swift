//
//  UOrdersViewController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SCLAlertView

class UOrdersViewController: UBaseViewController {

    fileprivate var service = APIOrderServices()
    
    private var orderList = OrderList()
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    var mOrderId = 0
    
    var alert:SCLAlertView? = nil
    
    let tipGoodsLabel = UILabel() // 商品价格输入框上面的提示
    let goodsLabel = UILabel() //商品价格
    let tipFreightLabel = UILabel() // 运费价格输入框上面的提示
    let freightLabel = UILabel() //运费价格
    let warnLabel = UILabel()
    let addPriceBtn = UIButton()
    
    let reducePriceBtn = UIButton()
    let inputFreightPriceTF = UITextField(frame: CGRect(x: 0, y: 0, width: 180, height: 35))
    let inputGoodsPriceTF = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
    
    //用了记录当前是否允许加载新数据（加载的时候会将其设为false，防止重复加载）
    var loadMoreEnable = true
    //记录当前加载到哪一页
    var pageRecord = 1
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: UOderCell.self)
//
        return tw
    }()

    override func configUI() {
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "正在刷新订单数据...")
        tableView.refreshControl?.addTarget(self, action: #selector(refreshOrderData), for: .valueChanged)
        configLoadMoreView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        getOrderList()
        
    }
    
    //MARK:网络请求-获取待处理订单列表数据
    func getOrderList(){
        loadMoreEnable = false
        service.getOrderList(status: 1, page: pageRecord, { (OrderListResponseModel) in
            if (self.pageRecord != 1) {
                self.orderList.order.append(contentsOf: OrderListResponseModel.data.order)
            } else {
                self.orderList = OrderListResponseModel.data
                self.tableView.refreshControl?.endRefreshing()
            }
            if(OrderListResponseModel.data.order.count >= 20){
                self.loadMoreEnable = true
            } else {
                self.loadMoreEnable = false
                self.activity.stopAnimating()
            }
            self.tableView.reloadData()
            self.pageRecord += 1
            
        }) { (APIErrorModel) in
            NSLog(APIErrorModel.msg ?? "...")
        }
    }
    
    //MARK:修改订单价格
    func modifyOrderPrice(orderId: Int, updatePrice: Int, updateExpress: Int, type: Int){
        service.modifyOrderPrice(orderId: orderId, updatePrice: updatePrice, updateExpress: updateExpress, type: type, {
            showHUDInView(text: "修改成功", inView: self.view)
        }) { (APIErrorModel) in
            showHUDInView(text: "修改失败", inView: self.view)
        }
    }
    
    @objc func refreshOrderData() {
        pageRecord = 1
        getOrderList()
    }
    
    //加价
    @objc func addOrderPrice(orderId: Int,updatePrice: Int, updateExpress: Int){
        
        self.modifyOrderPrice(orderId: mOrderId, updatePrice: updatePrice, updateExpress: updateExpress, type: 1)
    }
    
    //优惠
    @objc func reduceOrderPrice(orderId: Int,updatePrice: Int, updateExpress: Int){
        self.modifyOrderPrice(orderId: mOrderId, updatePrice: updatePrice, updateExpress: updateExpress, type: 0)
    }
    
}
//
//extension UOrdersViewController: UModifyPriceAlertViewDelegate{
//
//}

extension UOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        guard orderList.order == nil else {
            return orderList.order.count
        }
        return 0
    }
    
    //MARK:cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //订单商品数据展开时，需要动态获取高度再设置
        return 507
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK:cell数量
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell待更换
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UOderCell.self)
        cell.selectionStyle = .default
        cell.modifyPrice = {
            NSLog("修改价格")
            self.mOrderId = self.orderList.order[indexPath.section].order_id
            //获取点击事件
            self.configAlertView()
        }
        cell.deliveryGoods = {
            NSLog("发货")
            let alertController = UIAlertController(title: "温馨提示", message: "请选择发货方式", preferredStyle: UIAlertController.Style.alert)
            let cancleAction = UIAlertAction(title: "无需快递", style: UIAlertAction.Style.default){
                (action: UIAlertAction!) -> Void in
                self.service.deliveryGoods(order_id: self.orderList.order[indexPath.section].order_id, is_express: 0, express: "", express_no: "", words: "", {
                    
                }, { (APIErrorModel) in
                    print(APIErrorModel.msg ?? "-----")
                })
            }
            
            let okAction = UIAlertAction(title: "物流快递", style: UIAlertAction.Style.default) {
                (action: UIAlertAction!) -> Void in
                let vc = USettingDeliveryController()
                vc.title = "设置发货"
                vc.orderId = self.orderList.order[indexPath.section].order_id
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            alertController.addAction(cancleAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        cell.model = orderList.order[indexPath.section]

        return cell
        
    }
    
    //MARK:footerView即将显示的时候的回调
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {

        //当下拉到底部，执行loadMore()
        if (loadMoreEnable && section == orderList.order.count-1) {
            getOrderList()
        }
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (orderList.order.count != 1 && section == orderList.order.count-1){
            return 35
        }
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (orderList.order.count != 1 && section == orderList.order.count-1){
            return loadMoreView
        }
        let tipView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
        tipView.backgroundColor = UIColor.background
        return tipView
    }
    
    func configLoadMoreView() {
        loadMoreView.frame = CGRect(x:0, y:self.tableView.contentSize.height, width:self.tableView.bounds.size.width, height:45)
        loadMoreView.backgroundColor = UIColor.background
        loadMoreView.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
        //添加环形进度条
        activity.color = UIColor.black
        activity.startAnimating()
        
//        let tipView = UILabel()
//        tipView.text = "获取订单数据..."
//        loadMoreView.addSubview(tipView)
//        tipView.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.centerY.equalToSuperview()
//            ConstraintMaker.centerX.equalToSuperview().offset(activity.frame.width)
//        }
        loadMoreView.addSubview(activity)
        activity.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.right.equalTo(tipView.snp.left)
            ConstraintMaker.centerY.centerX.equalToSuperview()
        }
        activity.hidesWhenStopped = true
    }
    
    func configAlertView(){
        let style = SCLAlertView.SCLAppearance(
            kWindowWidth: screenWidth - 96, kTitleFont: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue", size: 18)!,
            showCloseButton: false,
            showCircularIcon: false,
            buttonsLayout: .horizontal
        )
        
        // Initialize SCLAlertView using custom Appearance
        alert = SCLAlertView(appearance: style)
        // Creat the subview
        alert?.viewWillAppear(true)
        let subview = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth-96, height: 203))
        
        tipGoodsLabel.text = "修改订单中所有商品的总价格"
        tipGoodsLabel.font = UIFont.systemFont(ofSize: 15)
        tipGoodsLabel.textColor = UIColor.hex(hexString: "#808080")
        subview.addSubview(tipGoodsLabel)
        tipGoodsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(10)
        }
        
        goodsLabel.text = "商品价格:"
        goodsLabel.font = UIFont.systemFont(ofSize: 15)
        goodsLabel.textColor = UIColor.black
        subview.addSubview(goodsLabel)
        goodsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(tipGoodsLabel.snp.bottom).offset(11)
        }
        
        //商品价格输入框
        inputGoodsPriceTF.text = ""
        inputGoodsPriceTF.layer.borderColor = UIColor.hex(hexString: "#E5E5E5").cgColor
        inputGoodsPriceTF.layer.borderWidth = 1
        inputGoodsPriceTF.layer.cornerRadius = 2
        inputGoodsPriceTF.keyboardType = UIKeyboardType.numberPad
        inputGoodsPriceTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        inputGoodsPriceTF.leftViewMode = .always
        subview.addSubview(inputGoodsPriceTF)
        inputGoodsPriceTF.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsLabel.snp.right).offset(5)
            ConstraintMaker.width.equalTo(190)
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.top.equalTo(tipGoodsLabel.snp.bottom).offset(11)
        })
        
        tipFreightLabel.text = "修改的是订单中运费的价格"
        tipFreightLabel.font = UIFont.systemFont(ofSize: 15)
        tipFreightLabel.textColor = UIColor.hex(hexString: "#808080")
        subview.addSubview(tipFreightLabel)
        tipFreightLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(inputGoodsPriceTF.snp.bottom).offset(20)
        }
        
        freightLabel.text = "运费价格:"
        freightLabel.font = UIFont.systemFont(ofSize: 15)
        freightLabel.textColor = UIColor.black
        subview.addSubview(freightLabel)
        freightLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(tipFreightLabel.snp.bottom).offset(11)
        }
        
        //运费价格输入框
        inputFreightPriceTF.text = ""
        inputFreightPriceTF.keyboardType = UIKeyboardType.numberPad
        inputFreightPriceTF.layer.borderColor = UIColor.hex(hexString: "#E5E5E5").cgColor
        inputFreightPriceTF.layer.borderWidth = 1
        inputFreightPriceTF.layer.cornerRadius = 2
        inputFreightPriceTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        inputFreightPriceTF.leftViewMode = .always
        subview.addSubview(inputFreightPriceTF)
        inputFreightPriceTF.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalTo(freightLabel.snp.right).offset(5)
            ConstraintMaker.width.equalTo(190)
            ConstraintMaker.height.equalTo(35)
            //                ConstraintMaker.right.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(tipFreightLabel.snp.bottom).offset(11)
        })
        //
        
        warnLabel.text = "优惠的运费不能超过原来的运费"
        warnLabel.textColor = UIColor.hex(hexString: "#FF4444")
        warnLabel.font = UIFont.systemFont(ofSize: 15)
        subview.addSubview(warnLabel)
        warnLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(inputFreightPriceTF.snp.bottom).offset(15)
        }
        
        
//        addPriceBtn.backgroundColor = UIColor.white
//        addPriceBtn.setTitle("加价", for: .normal)
//        addPriceBtn.setTitleColor(UIColor.hex(hexString: "#07D781"), for: UIControl.State.normal)
//        addPriceBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        subview.addSubview(addPriceBtn)
//        addPriceBtn.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalToSuperview()
//            ConstraintMaker.width.equalToSuperview().dividedBy(2)
//            ConstraintMaker.height.equalTo(44)
//            ConstraintMaker.bottom.equalToSuperview()
//        }
//        addPriceBtn.addTarget(self, action: #selector(addPrice), for: UIControl.Event.touchDown)
//
//
//        reducePriceBtn.backgroundColor = UIColor.white
//        reducePriceBtn.setTitle("优惠", for: .normal)
//        reducePriceBtn.setTitleColor(UIColor.hex(hexString: "#07D781"), for: UIControl.State.normal)
//        reducePriceBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        subview.addSubview(reducePriceBtn)
//        reducePriceBtn.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalTo(addPriceBtn.snp.right)
//            ConstraintMaker.width.equalToSuperview().dividedBy(2)
//            ConstraintMaker.height.equalTo(44)
//            ConstraintMaker.bottom.equalToSuperview()
//        }
//        reducePriceBtn.addTarget(self, action: #selector(reducePrice), for: UIControl.Event.touchDown)
        
        _ = alert?.addButton("加价", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "##1C98F6"), target:self, selector:#selector(addOrderPrice))
        _ = alert?.addButton("优惠", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "#07D781"), target:self, selector:#selector(reduceOrderPrice))

        alert?.customSubview = subview
        
        alert?.showEdit("价格修改", subTitle: "ddddddddd")
        
    }
    
    //优惠
    @objc func reducePrice(){
        var goodspp:Int = 0
        var devily:Int = 0
        if(inputGoodsPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputGoodsPriceTF.text ?? "0") {
                goodspp = goodsPrice
            }
        }
        if(inputFreightPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputFreightPriceTF.text ?? "0") {
                devily = goodsPrice
            }
        }
        
        self.reduceOrderPrice(orderId: mOrderId, updatePrice: goodspp, updateExpress: devily)
        alert?.hideView()
    }
    
    //加价
    @objc func addPrice(orderId: Int,updatePrice: Int, updateExpress: Int){
        var goodspp:Int = 0
        var devily:Int = 0
        if(inputGoodsPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputGoodsPriceTF.text ?? "0") {
                goodspp = goodsPrice
            }
        }
        if(inputFreightPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputFreightPriceTF.text ?? "0") {
                devily = goodsPrice
            }
        }
        
        self.addOrderPrice(orderId: mOrderId, updatePrice: goodspp, updateExpress: devily)
        alert?.hideView()
    }

}
