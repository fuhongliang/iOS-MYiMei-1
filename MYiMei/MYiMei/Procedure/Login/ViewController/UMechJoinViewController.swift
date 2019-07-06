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
                            }
                        }
                })
            }
        }
    }
}


extension UMechJoinViewController: UMchJoinViewDelegate,TLPhotosPickerLogDelegate {
    func tapPushApply() {
        
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
