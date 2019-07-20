//
//  UTabBarController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false

        /// 待处理
        let onePageVC = UOrdersViewController()
        addChildViewController(onePageVC,
                               title: "待处理",
                               image: UIImage(named: "tab_home"),
                               selectedImage: UIImage(named: "tab_home_S"))

        /// 订单管理
        let classVC = UManagerOrdersController()
        addChildViewController(classVC,
                               title: "订单管理",
                               image: UIImage(named: "tab_manager_orders"),
                               selectedImage: UIImage(named: "tab_manager_orders_S"))

        /// 我的店铺
        let mineVC = UMineViewController()
        addChildViewController(mineVC,
                               title: "我的店铺",
                               image: UIImage(named: "tab_mine"),
                               selectedImage: UIImage(named: "tab_mine_S"))


    }

    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {

        childController.title = title
        childController.tabBarItem = UITabBarItem(title: title,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0);

        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        addChild(UNavigationController(rootViewController: childController))
    }

}

extension UTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}

