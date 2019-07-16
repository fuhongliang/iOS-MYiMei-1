//
//  UOrderDetailsViewController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/4.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
class UOrderDetailsViewController: UBaseViewController {
    
    let mOrderDetailsViewController = UOrderDetailsView()
    
    var orderId = 0
    
    override func configUI() {
        mOrderDetailsViewController.setView()
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        scrollView.addSubview(mOrderDetailsViewController)
        scrollView.showsVerticalScrollIndicator = false
        mOrderDetailsViewController.snp.updateConstraints { (make) -> Void in
            make.width.equalTo(screenWidth)
            make.height.equalTo(1119)
            make.top.equalTo(scrollView)
            make.leading.equalTo(scrollView)
            make.trailing.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
        }
        scrollView.contentSize = CGSize(width: screenWidth, height: 1125)
        view.addSubview(scrollView)
    }
}
