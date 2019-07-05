//
//  UMechJoinViewController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import BSImagePicker
import Photos

class UMechJoinViewController: UBaseViewController {
    
    let mMchJoinView = UMchJoinView()
    override func configUI() {
        mMchJoinView.delegate = self
        mMchJoinView.setView()
        self.view.addSubview(mMchJoinView)
        mMchJoinView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }

    func tapChooseLogoAction() {
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
            print("Finish: \(assets)")
//            mMchJoinView.storeLogoBtn.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
        }, completion: nil)
    }
}
extension UMechJoinViewController: UMchJoinViewDelegate {
    func tapChooseStoreLogoPicAction() {
        self.tapChooseLogoAction()
    }

    func tapChooseStoreBgPicAction() {

    }
}
