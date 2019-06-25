//
//  ULoginViewController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import MBProgressHUD

public func showHUDInView(text: String, inView: UIView) {
    let hud = MBProgressHUD.showAdded(to: inView, animated: true)
    hud.mode = MBProgressHUDMode.text
    hud.label.text = text
    hud.hide(animated: true, afterDelay: 2.0)
}

class ULoginViewController: UBaseViewController {

    fileprivate var service: APIUserServices = APIUserServices()

    let loginView = ULoginView()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func configNavigationBar() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.barStyle(.clear)
            navi.disablePopGesture = false
            navi.setNavigationBarHidden(false, animated: true)
        }
    }

    override func configUI() {
        
        loginView.setLoginView(passWordLogin: true)
        loginView.delegate = self

        self.view.addSubview(loginView)
        self.view.backgroundColor = UIColor.white

        loginView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
    }
}

extension ULoginViewController: ULoginViewDelegate {
    func okTapAction(phoneNumber: String, password: String) {
        guard phoneNumber.count > 0 else {
            showHUDInView(text: "请输入手机号码", inView: view)
            return
        }

        guard password.count > 0 else {
            showHUDInView(text: "请输入密码或者验证码", inView: view)
            return
        }

        service.login(phoneNumber: phoneNumber, password: password, { (APILoginResponseModel) in
            let rootVC = UIApplication.shared.delegate as! AppDelegate
            rootVC.window?.rootViewController = UTabBarController()
        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg!, inView: self.view)
        }
    }
}


