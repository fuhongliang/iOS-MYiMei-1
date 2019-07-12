//
//  UGoodsManagementController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UGoodsManagementController: UBaseViewController {
    fileprivate var service: APIGoodsServices = APIGoodsServices()

    var categoryList = [CategoryModel]()

    var goodsList = [GoodsModel]()

    var curCategoryIndex = 0

    lazy var categoryTableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.delegate = self
        tw.dataSource = self
        tw.separatorColor = UIColor.clear
        tw.showsVerticalScrollIndicator = false
        tw.register(cellType: UBaseTableViewCell.self)
        tw.register(cellType: UCategoryCell.self)
        return tw
    }()

    lazy var goodsTableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.white
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: UGoodsCell.self)
        tw.uHead = URefreshHeader{ [weak self] in self?.loadGoodsData() }
        tw.uempty = UEmptyView { [weak self] in self?.loadGoodsData() }
        return tw
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
        loadCategoryData()
    }

    @objc private func loadCategoryData() {
        let mch_id: Int = APIUser.shared.user!.mch_id ?? 0
        let access_token: String = getToken()
        service.getCategory(mch_id: mch_id, access_token: access_token, { (CategoryResponeModel) in
            self.categoryList = CategoryResponeModel.data?.cats ?? []
            self.categoryTableView.reloadData()
            self.loadGoodsData()
        }, { (APIErrorModel) in
            showHUDInView(text: "拉取列表失败", inView: self.view)
        })

    }


    @objc private func loadGoodsData() {
        let mch_id: Int = APIUser.shared.user!.mch_id ?? 0
        let access_token: String = getToken()
        service.getGoodsList(mch_id: mch_id, cat_id: categoryList[curCategoryIndex].id!, access_token: access_token, { (GoodsResponeModel) in
            self.goodsList = GoodsResponeModel.data?.goods ?? []
            self.goodsTableView.reloadData()
        }) { (APIErrorModel) in
            showHUDInView(text: "拉取列表失败", inView: self.view)
        }

    }

    override func configUI() {
        let bottomTab = UBottomTab()
        bottomTab.configUI()
        self.view.addSubview(bottomTab)
        bottomTab.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview()
            ConstraintMaker.height.equalTo(67)
        }

        //MARK:发布商品
        bottomTab.addGoodsBtn.addTarget(self, action: #selector(showGoodDetailView), for: UIControl.Event.touchDown)
        //MARK:新建分类
        bottomTab.addCategoryBtn.addTarget(self, action: #selector(showAddCategoryView), for: UIControl.Event.touchDown)

        //MARK:管理分类
        bottomTab.addManageCategoryBtn.addTarget(self, action: #selector(showManageCategoryView), for: UIControl.Event.touchDown)


        self.view.addSubview(categoryTableView)
        categoryTableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.bottom.equalTo(bottomTab.snp.top)
            ConstraintMaker.width.equalTo(100)
        }

        self.view.addSubview(goodsTableView)
        goodsTableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(categoryTableView.snp.right)
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.bottom.equalTo(bottomTab.snp.top)
            ConstraintMaker.right.equalToSuperview()
        }
    }

    //MARK:发布商品
    @objc func showGoodDetailView(){
        let vc = UGoodsDetailsController(goodscateList: categoryList)
        vc.title = "发布商品"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    //MARK:新建分类
    @objc func showAddCategoryView(){
//        let vc = UGoodsDetailsController()
//        vc.title = "新建分类"
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    //MARK:管理分类
    @objc func showManageCategoryView(){
//        let vc = UGoodsDetailsController()
//        vc.title = "管理分类"
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    //MARK: 提示框
    func showAlertControllerStyle(title:String , message:String,goodsIndex:Int) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
            (action: UIAlertAction!) -> Void in
            self.deleteGoods(goodsIndex:goodsIndex)
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

    //MARK:删除

    @objc private func deleteGoods(goodsIndex:Int) {
        let mch_id: Int = APIUser.shared.user!.mch_id ?? 0
        let access_token: String = getToken()
        service.deleteGoods(mch_id: mch_id, goods_id: goodsList[goodsIndex].goods_id ?? 0, access_token: access_token, { () in
            self.goodsList.remove(at: goodsIndex)
            self.goodsTableView.reloadData()
        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "删除失败", inView: self.view)
        }
    }

    //MARK:上下架

    @objc private func popupGoods(goodsIndex:Int,status:Int) {
        let mch_id: Int = APIUser.shared.user!.mch_id ?? 0
        let access_token: String = getToken()
        service.modifyGoodsStatus(mch_id: mch_id, goods_id: goodsList[goodsIndex].goods_id ?? 0, status: status, access_token: access_token, { () in
            self.goodsList[goodsIndex].status = status
            self.goodsTableView.reloadData()
        }, { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "上下架失败", inView: self.view)
        })
    }


}

extension UGoodsManagementController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(tableView.isEqual(categoryTableView)){
            return 48
        }else{
            return 144
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.isEqual(categoryTableView)){
            return categoryList.count
        }else{
            return goodsList.count
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView.isEqual(categoryTableView)){
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UCategoryCell.self)
            if(curCategoryIndex == indexPath.row){
                cell.addSubview(cell.categoryImageView)
                cell.categoryImageView.snp.makeConstraints { (ConstraintMaker) in
                    ConstraintMaker.left.equalToSuperview()
                    ConstraintMaker.width.equalTo(3)
                    ConstraintMaker.height.equalTo(25)
                    ConstraintMaker.centerY.equalToSuperview()
                }
                cell.backgroundColor = UIColor.white
                cell.categoryLabel.textColor = UIColor.theme
            }else{
                cell.categoryImageView.removeFromSuperview()
                cell.categoryLabel.textColor = UIColor.hex(hexString: "#666666")
                cell.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
            }
            cell.model = categoryList[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UGoodsCell.self)
            cell.model = goodsList[indexPath.row]
            cell.subscribeGoodsPopupAction = {
                self.popupGoods(goodsIndex:indexPath.row,status: self.goodsList[indexPath.row].status == 0 ? 1 : 0)
            }
            cell.subscribeGoodsEditAction = {
                let vc = UGoodsDetailsController(goodscateList: self.categoryList)
                vc.title = "编辑商品"
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell.subscribeGoodsDeleteAction = {
                self.showAlertControllerStyle(title:"温馨提示" , message:"是否确认删除该商品",goodsIndex:indexPath.row )
            }

            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(tableView.isEqual(categoryTableView)){
            curCategoryIndex = indexPath.row
            tableView.reloadData()
            loadGoodsData()
        }else{

        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

}


