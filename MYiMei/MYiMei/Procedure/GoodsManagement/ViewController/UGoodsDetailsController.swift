//
//  UGoodsDetailsController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/27.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import BSImagePicker
import Photos

class UGoodsDetailsController: UBaseViewController {
    fileprivate var service: APIGoodsServices = APIGoodsServices()

    var goodsDetail = GoodsDetailModel()

    let goodsDetailView = UGoodsDetailView()

    var tagBtnSet = [UIButton:String]()

    var serviceTag = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
        loadGoodsDetailData()
    }

    @objc private func loadGoodsDetailData() {
        //        let mch_id: Int = APIUser.shared.user!.mch_id ?? 0
        //        let access_token: String = getToken()
        //        service.getCategory(mch_id: mch_id, access_token: access_token, { (CategoryResponeModel) in
        //            self.categoryList = CategoryResponeModel.data?.cats ?? []
        //            self.categoryTableView.reloadData()
        //            self.loadGoodsData()
        //        }, { (APIErrorModel) in
        //            showHUDInView(text: "拉取列表失败", inView: self.view)
        //        })

    }

    override func configUI() {
        goodsDetailView.configUI()
        goodsDetailView.delegate = self
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        scrollView.addSubview(goodsDetailView)
        scrollView.showsVerticalScrollIndicator = false
        goodsDetailView.snp.updateConstraints { (make) -> Void in
            make.width.equalTo(screenWidth)
            make.height.equalTo(1202)
            make.top.equalTo(scrollView)
            make.leading.equalTo(scrollView)
            make.trailing.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
        }
        scrollView.contentSize = CGSize(width: screenWidth, height: 1125)
        view.addSubview(scrollView)
    }
}

extension UGoodsDetailsController: UGoodsDetailViewDelegate {
    func tapChooseCateAction() {

    }

    func tapChooseGoodsCateAction() {

    }

    func tapChooseGoodsTagAction(tag: UIButton) {
        tag.isSelected = !tag.isSelected
        if(tag.isSelected){
            tag.backgroundColor = UIColor.theme
            tagBtnSet.updateValue((tag.titleLabel?.text!)! + ",", forKey: tag)
        }else{
            tag.backgroundColor = UIColor.white
            tagBtnSet.updateValue("", forKey: tag)
        }
        self.getServiceTags()
    }

    func getServiceTags () {
        serviceTag = ""
        for tags in tagBtnSet{
            serviceTag = serviceTag + tags.value
        }
    }

    func tapSaveAction(name: String, detail: String, unit: String, weight: String, original_price: String, price: String, pieces: String, forehead: String, goods_num: String) {

    }

    func tapChooseGoodsSLTAction() {

    }

    func tapChooseGoodsPicAction() {

    }

}
