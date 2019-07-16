//
//  UGoodsDetailsController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/27.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import Photos
import TLPhotoPicker

class UGoodsDetailsController: UBaseViewController ,TLPhotosPickerViewControllerDelegate{
    fileprivate var goodsService: APIGoodsServices = APIGoodsServices()
    var service: APIUserServices = APIUserServices()

    var cateList = [PlatCateModel]()

    var goodscateList = [CategoryModel]()

    var curCatIndex = 0

    var curGoodsCatIndex = 0

    var choosePicType = Int()
    var selectedAssets = [TLPHAsset]()

    var goodsDetail = GoodsDetailModel()

    let goodsDetailView = UGoodsDetailView()

    var tagBtnSet = [UIButton:String]()

    var serviceTag = String()

    var coverPic = String()

    var goodsPic = String()

    var goodsPicArray = [String]()

    var plat_cat_id = 0

    var goods_cat_id = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
        loadGoodsDetailData()
        getPlatCat()
    }


    convenience init(goodscateList:[CategoryModel]?) {
        self.init()
        self.goodscateList = goodscateList!
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
        self.goodsDetailView.choosegoodsClassBtn.setTitle(goodscateList[curGoodsCatIndex].name!, for: UIControl.State.normal)
    }

    func tapChoosePicAction() {
        let viewController = CustomPhotoPickerViewController()
        viewController.delegate = self
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.numberOfColumn = 3
        configure.allowedVideo = false
        configure.singleSelectedMode = true
        viewController.configure = configure
        viewController.selectedAssets = self.selectedAssets
        viewController.logDelegate = self
        self.present(viewController, animated: true, completion: nil)
    }


    func showExceededMaximumAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "", message: "Exceed Maximum Number Of Selection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }

    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        self.selectedAssets = withTLPHAssets
        getFirstSelectedImage()
        //iCloud or video
        //getAsyncCopyTemporaryFile()
    }

    func getAsyncCopyTemporaryFile() {
        if let asset = self.selectedAssets.first {
            asset.tempCopyMediaFile(convertLivePhotosToJPG: false, progressBlock: { (progress) in
                print(progress)
            }, completionBlock: { (url, mimeType) in
                print("completion\(url)")
                print(mimeType)
            })
        }
    }

    func getFirstSelectedImage() {
        if let asset = self.selectedAssets.first {
            if let image = asset.fullResolutionImage {

                switch choosePicType {
                case 0:
                    self.goodsDetailView.addGoodsCoverPic.setBackgroundImage(image, for: UIControl.State.normal)
                    break
                case 1:
                    self.goodsDetailView.addGoodsPic.setBackgroundImage(image, for: UIControl.State.normal)
                    break
                default:
                   break
                }

                self.uploadPic()
            }else {
                print("Can't get image at local storage, try download image")
                asset.cloudImageDownload(progressBlock: { [weak self] (progress) in
                    DispatchQueue.main.async {
                        print(progress)
                    }
                    }, completionBlock: { [weak self] (image) in
                        if let image = image {
                            //use image
                            DispatchQueue.main.async {
                                switch self!.choosePicType {
                                case 0:
                                self!.goodsDetailView.addGoodsCoverPic.setBackgroundImage(image, for: UIControl.State.normal)
                                    break
                                case 1:
                                    self!.goodsDetailView.addGoodsPic.setBackgroundImage(image, for: UIControl.State.normal)
                                    break
                                default:
                                    break
                                }

                                self!.uploadPic()
                            }
                        }
                })
            }
        }
    }

    func getPlatCat(){
        goodsService.getMchPtCats({ (PlatCateResponeModel) in
        self.cateList = PlatCateResponeModel.data!.pt_cats!
        self.goodsDetailView.choosePlatformClassBtn.setTitle(self.cateList[self.curCatIndex].name!, for: UIControl.State.normal)
        }, { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        })
    }

    func uploadPic(){
        switch choosePicType {
        case 0:
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg: self.goodsDetailView.addGoodsCoverPic.backgroundImage(for: UIControl.State.normal)!)
            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)
            // 将Data转化成 base64的字符串
            let imageBase64String = imageData.base64EncodedString()
            service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                self.coverPic =  UploadFileResponeModel.data?.url ?? ""
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }
            break
        case 1:
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg: self.goodsDetailView.addGoodsPic.backgroundImage(for: UIControl.State.normal)!)
            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)
            // 将Data转化成 base64的字符串s
            let imageBase64String = imageData.base64EncodedString()
            service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                self.goodsPic = UploadFileResponeModel.data?.url ?? ""
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }
            break
        default:

           break
        }
    }

}

extension UGoodsDetailsController: UGoodsDetailViewDelegate,TLPhotosPickerLogDelegate {
    func tapChooseCateAction() {
        // Simple Option Picker
        var dummyList = [String]()
        for item in cateList{
            dummyList.append(item.name!)
        }
        // Simple Option Picker with selected index

        RPicker.selectOption(title: "", hideCancel: true, dataArray: dummyList, selectedIndex: curCatIndex) { (selctedText, atIndex) in
            self.curCatIndex = atIndex
            self.goodsDetailView.choosePlatformClassBtn.setTitle(selctedText, for: UIControl.State.normal)
        }
    }

    func tapChooseGoodsCateAction() {
        // Simple Option Picker
        var dummyList = [String]()
        for item in goodscateList{
            dummyList.append(item.name!)
        }
        // Simple Option Picker with selected index

        RPicker.selectOption(title: "", hideCancel: true, dataArray: dummyList, selectedIndex: curGoodsCatIndex) { (selctedText, atIndex) in
            self.curGoodsCatIndex = atIndex
            self.goodsDetailView.choosegoodsClassBtn.setTitle(selctedText, for: UIControl.State.normal)
        }
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

        guard name.count > 0 else {
            showHUDInView(text: "请输入商品名", inView: view)
            return
        }

        guard detail.count > 0 else {
            showHUDInView(text: "请输入商品描述", inView: view)
            return
        }
        guard coverPic.count > 0 else {
            showHUDInView(text: "请选择缩略图", inView: view)
            return
        }

        guard goodsPic.count > 0 else {
            showHUDInView(text: "请选择商品主图", inView: view)
            return
        }
        plat_cat_id = cateList[curCatIndex].id ?? 0
        guard plat_cat_id > 0 else {
            showHUDInView(text: "请选择平台分类", inView: view)
            return
        }

        goods_cat_id = goodscateList[curGoodsCatIndex].id ?? 0
        guard goods_cat_id > 0 else {
            showHUDInView(text: "请选择商品分类", inView: view)
            return
        }

        guard weight.count > 0 else {
            showHUDInView(text: "请输入商品重量", inView: view)
            return
        }

        guard original_price.count > 0 else {
            showHUDInView(text: "请输入商品原件", inView: view)
            return
        }

        guard price.count > 0 else {
            showHUDInView(text: "请输入商品售价", inView: view)
            return
        }
        guard goods_num.count > 0 else {
            showHUDInView(text: "请输入商品库存", inView: view)
            return
        }

        goodsPicArray.append(goodsPic)

        goodsService.addGoods(name: name, detail: detail, cover_pic: coverPic, goods_pic: goodsPicArray, pt_cat_id: plat_cat_id, goods_cat_id: goods_cat_id, unit: unit, weight: weight, original_price: original_price, price: price, pieces: pieces, forehead: forehead, service: serviceTag, goods_num: goods_num, {

            showHUDInView(text: "发布成功", inView: self.view)
            self.pressBack()
        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "发布失败" , inView: self.view)

        }


    }

    func selectedCameraCell(picker: TLPhotosPickerViewController) {

    }

    func deselectedPhoto(picker: TLPhotosPickerViewController, at: Int) {

    }

    func selectedPhoto(picker: TLPhotosPickerViewController, at: Int) {

    }

    func selectedAlbum(picker: TLPhotosPickerViewController, title: String, at: Int) {

    }

    func tapChooseGoodsSLTAction() {
        choosePicType = 0
        self.tapChoosePicAction()
    }

    func tapChooseGoodsPicAction() {
        choosePicType = 1
        self.tapChoosePicAction()
    }

}
