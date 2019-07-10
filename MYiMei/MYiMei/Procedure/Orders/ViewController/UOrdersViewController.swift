//
//  UOrdersViewController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UOrdersViewController: UBaseViewController {

    fileprivate var service = APIOrderServices()
    
    private var orderList = OrderList()
    
    
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
        return tw
    }()

    override func configUI() {
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "正在刷新待处理订单数据...")
        tableView.refreshControl?.addTarget(self, action: #selector(refreshOrderData), for: .valueChanged)
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
            NSLog("成功")
            if (self.pageRecord != 1) {
                self.orderList.order.append(contentsOf: OrderListResponseModel.data.order)
            } else {
                self.orderList = OrderListResponseModel.data
                self.tableView.refreshControl?.endRefreshing()
            }
            self.tableView.reloadData()
            self.loadMoreEnable = true
        }) { (APIErrorModel) in
            NSLog("错误")
            NSLog(APIErrorModel.msg ?? "...")
        }
    }
    
    @objc func refreshOrderData() {
        pageRecord = 1
        getOrderList()
    }
    
}

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
//        if(indexPath.section == 2 || indexPath.section == 1 && indexPath.row == 0){
//            return 55
//        }else{
//            return 44
//        }
        return 494
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
        }
        cell.deliveryGoods = {
            NSLog("发货")
        }
        cell.model = orderList.order[indexPath.section]
//        if (orderInfo.isPay==0) {
//            cell.statusLaber.text = "待付款"
//            cell.statusLaber.textColor = UIColor.hex(hexString: "#FF4444")
//            cell.priceModifyBg.setTitle("价格修改", for: .normal)
//        } else {
//            cell.statusLaber.text = "待发货"
//            cell.statusLaber.textColor = UIColor.hex(hexString: "#1C98F6")
//            cell.priceModifyBg.setTitle("发货", for: .normal)
//        }
//        cell.userNameLaber.text = orderInfo.name
//        cell.userPhoneLaber.text = orderInfo.mobile
//        cell.addressLaber.text = orderInfo.address
//        cell.commodityNameLaber.text = orderInfo.goodsList[0].name
//        var label:String = ""
//        for attr in orderInfo.goodsList[0].attr{
//            label = label + attr.attrName
//        }
//        cell.commoditySpecificationLaber.text = label
//        cell.commodityPriceLaber.text = "￥" + orderInfo.goodsList[0].totalPrice
//        cell.commodityNumberLaber.text = "x" + String(orderInfo.goodsList[0].num)
//        cell.orderNumberLabel.text = "订单编号：" + orderInfo.orderNo
//        cell.orderTimeLaber.text = "下单时间：" + String(orderInfo.addtime)
//        cell.leaveCommentsRightLaber.text = orderInfo.remark
//        cell.freightPriceLaber.text = "￥" + orderInfo.expressPrice
//        cell.totalPriceLaber.text = "￥" + orderInfo.totalPrice
        
        //当下拉到底部，执行loadMore()
        if (loadMoreEnable && indexPath.row == orderList.order.count-1) {
            pageRecord += 1
            getOrderList()
        }
        
        return cell
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (orderList.order.count != 1 && section == orderList.order.count-1){
            return loadMoreView()
        }
        let tipView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
        return tipView
    }
    
    func loadMoreView() -> UIView {
        let loadMoreView = UIView(frame: CGRect(x:0, y:self.tableView.contentSize.height,
                                                 width:self.tableView.bounds.size.width, height:25))
        loadMoreView.backgroundColor = UIColor.background
        
        //添加环形进度条
        let activity = UIActivityIndicatorView()
        activity.center = loadMoreView.center
        activity.color = UIColor.white
        activity.startAnimating()
        activity.hidesWhenStopped = true
        loadMoreView.addSubview(activity)
        return loadMoreView
    }
    
}

