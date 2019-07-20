//
//  UBaseViewController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Reusable
import Kingfisher

class UBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.background
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }

        configUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }

    func configUI() {}

    func configNavigationBar() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.barStyle(.theme)
            navi.disablePopGesture = false
            navi.setNavigationBarHidden(false, animated: true)
            if navi.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"),
                                                                   target: self,
                                                                   action: #selector(pressBack))
//                let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"),
//                                                        target: self,
//                                                        action: #selector(pressBack))
////                UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-button-whiteArrow.png"] style:UIBarButtonItemStylePlain target:self action:@selector(logoutBarBtnPressed:)];
//
////                var fixedBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//                leftBarButtonItem
//                self.navigationItem.leftBarButtonItem = leftBarButtonItem
////                fixedBarButtonItem.width = -15;
                
//                self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:fixedBarButtonItem, buttonItem, nil];
            }
        }
    }

    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension UBaseViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
