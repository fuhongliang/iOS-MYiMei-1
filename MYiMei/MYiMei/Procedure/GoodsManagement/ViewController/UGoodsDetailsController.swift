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

        goodsDetailView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
        }

        scrollView.contentSize = CGSize(width: screenWidth, height: 1125) // ContentSize属性

        view.addSubview(scrollView)


        //
        //        goodsDetailView.snp.makeConstraints { (ConstraintMaker) in
        //            ConstraintMaker.left.equalToSuperview()
        //            ConstraintMaker.top.equalToSuperview()
        //            ConstraintMaker.bottom.equalToSuperview()
        //            ConstraintMaker.right.equalToSuperview()
        //        }

    }
}

extension UGoodsDetailsController: UGoodsDetailViewDelegate {
    func tapChooseGoodsSLTAction() {
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = 1
        bs_presentImagePickerController(vc, animated: true,
                                        select: { (asset: PHAsset) -> Void in
                                            // User selected an asset.
                                            // Do something with it, start upload perhaps?
        }, deselect: { (asset: PHAsset) -> Void in
            print("Selected:")
            print(asset)
            // User deselected an assets.
            // Do something, cancel upload?
        }, cancel: { (assets: [PHAsset]) -> Void in
            // User cancelled. And this where the assets currently selected.
        }, finish: { (assets: [PHAsset]) -> Void in
            // User finished with these assets
        }, completion: nil)
    }

    func tapChooseGoodsPicAction() {
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = 1
        bs_presentImagePickerController(vc, animated: true,
                                        select: { (asset: PHAsset) -> Void in
                                            // User selected an asset.
                                            // Do something with it, start upload perhaps?
        }, deselect: { (sasset: PHAsset) -> Void in
            // User deselected an assets.
            // Do something, cancel upload?
        }, cancel: { (assets: [PHAsset]) -> Void in
            // User cancelled. And this where the assets currently selected.
        }, finish: { (assets: [PHAsset]) -> Void in
            // User finished with these assets
        }, completion: nil)
    }

}
