//
//  UMechJoinViewController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import Photos
import TLPhotoPicker

class UMechJoinViewController: UBaseViewController,TLPhotosPickerViewControllerDelegate{
    var selectedAssets = [TLPHAsset]()
    let mMchJoinView = UMchJoinView()
    var isChoosingLogo = Bool()
    var logoPath = String()
    var storeBgPath = String()


    fileprivate var service: APIUserServices = APIUserServices()

    override func configUI() {
        mMchJoinView.delegate = self
        mMchJoinView.setView()
        self.view.addSubview(mMchJoinView)
        mMchJoinView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
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
                print(image)
                if(isChoosingLogo){
                    self.mMchJoinView.storeLogoBtn.setBackgroundImage(image, for: UIControl.State.normal)
                }else{
                    self.mMchJoinView.storeBgBtn.setBackgroundImage(image, for: UIControl.State.normal)
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
                                if(self!.isChoosingLogo){
                                    self?.mMchJoinView.storeLogoBtn.setBackgroundImage(image, for: UIControl.State.normal)
                                }else{
                                    self?.mMchJoinView.storeBgBtn.setBackgroundImage(image, for: UIControl.State.normal)
                                }
                                self!.uploadPic()
                            }
                        }
                })
            }
        }
    }

    func uploadPic(){
        if(isChoosingLogo){
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg: self.mMchJoinView.storeLogoBtn.backgroundImage(for: UIControl.State.normal)!)

            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)

            // 将Data转化成 base64的字符串
            let imageBase64String = imageData.base64EncodedString()

            service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                self.logoPath =  UploadFileResponeModel.data?.url ?? ""
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }


        }else{
            // 获取图片
            let image = ImagePressHelper.init().resizeImage(originalImg: self.mMchJoinView.storeBgBtn.backgroundImage(for: UIControl.State.normal)!)
            // 将图片转化成Data
            let imageData = ImagePressHelper.init().compressImageSize(image: image)

            // 将Data转化成 base64的字符串s
            let imageBase64String = imageData.base64EncodedString()

            service.uploadPic(ext: "jpg", type: "image", size:imageData.count , image: imageBase64String , { (UploadFileResponeModel) in
                self.storeBgPath =  UploadFileResponeModel.data?.url ?? ""
            }) { (APIErrorModel) in
                showHUDInView(text: APIErrorModel.msg!, inView: self.view)
            }
        }
    }
}


extension UMechJoinViewController: UMchJoinViewDelegate,TLPhotosPickerLogDelegate {
    func tapChooseStoreAddressAction() {
        let vc = UChooseAddressFromMap()
        vc.title = "店铺地址"
        navigationController?.pushViewController(vc, animated: true)
    }

    func tapPushApply(contactName: String, phoneNumber: String, storeName: String, storeClass: String, storeAddress: String, serviceTel: String) {
        guard contactName.count > 0 else {
            showHUDInView(text: "请输入联系人", inView: view)
            return
        }

        guard phoneNumber.count > 0 else {
            showHUDInView(text: "请输入手机号码", inView: view)
            return
        }

        guard storeName.count > 0 else {
            showHUDInView(text: "请输入店铺名称", inView: view)
            return
        }

        guard storeClass.count > 0 else {
            showHUDInView(text: "请选择店铺分类", inView: view)
            return
        }

        guard storeAddress.count > 0 else {
            showHUDInView(text: "请选择店铺地址", inView: view)
            return
        }

        guard serviceTel.count > 0 else {
            showHUDInView(text: "请输入客服电话", inView: view)
            return
        }

        guard logoPath.count > 0 else {
            showHUDInView(text: "请选择店铺Logo", inView: view)
            return
        }

        guard storeBgPath.count > 0 else {
            showHUDInView(text: "请选择店铺背景图", inView: view)
            return
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

    func tapChooseStoreLogoPicAction() {
        isChoosingLogo = true
        self.tapChoosePicAction()
    }

    func tapChooseStoreBgPicAction() {
        isChoosingLogo = false
        self.tapChoosePicAction()
    }
}
