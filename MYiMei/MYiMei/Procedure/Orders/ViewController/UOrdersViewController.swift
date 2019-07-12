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
    
    let activity = UIActivityIndicatorView()
    var loadMoreView = UIView()
    
    
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
//        tableView.tableFooterView = loadMoreView
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
        //订单商品数据展开时，需要动态获取高度再设置
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
    
}

