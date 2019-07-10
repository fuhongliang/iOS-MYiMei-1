//
//  UChangePasswordController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/5.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UChangePasswordController: UBaseViewController {
    
    fileprivate var service = APIUserServices()
    
    let changePassword = UChangePasswordView()
    
    var title：String = "修改密码"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changePassword.configUI()
        changePassword.delegate = self
        self.view.addSubview(changePassword)
        changePassword.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    func getVerification() {
        service.getVerification(username: "13763016638", { (CategoryResponeModel) in
            self.startTimer()
        }) { (APIErrorModel) in
            
        }
        
    }
    
    
    //MARK:倒计时
    func startTimer() {
        var timeCount = 60
        // 在global线程里创建一个时间源
        let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        // 设定这个时间源是每秒循环一次，立即开始
        timer.schedule(deadline: .now(), repeating: .seconds(1))
        // 设定时间源的触发事件
        timer.setEventHandler(handler: {
            // 每秒计时一次
            timeCount = timeCount - 1
            // 时间到了取消时间源
            if timeCount <= 0 {
                timer.cancel()
                DispatchQueue.main.async {
                    //重置
                    self.changePassword.getVerificationCodeBtn.setTitle("获取验证码", for: UIControl.State.normal)
                }
                
            }
            // 返回主线程处理一些事件，更新UI等等
            DispatchQueue.main.async {
                self.changePassword.getVerificationCodeBtn.setTitle(String (timeCount) + "S重新获取", for: UIControl.State.normal)
            }
        })
        // 启动时间源
        timer.resume()
    }
    
}



extension UChangePasswordController: UChangePasswordViewDelegate {
    func tapConfirmChangeCodeAction(code: String, newPassword: String, newPasswordAgain: String) {
        guard code.count > 0 else {
            showHUDInView(text: "请输入4位数验证码", inView: view)
            return
        }
        
        guard newPassword.count > 0 else {
            showHUDInView(text: "请输入新密码", inView: view)
            return
        }
        guard newPasswordAgain.count > 0 else {
            showHUDInView(text: "请再次输入密码", inView: view)
            return
        }
        
//        service.modifyPwd(mch_id: APIUser.shared.user?.mch_id!, access_token: APIUser.shared.user?.access_token!, phone: APIUser.shared.user?., code: code, password: passwd, {
//
//        }) { (APIErrorModel) in
//
//        }
    }
    
    
    func tapGetVerificationCodeAction() {
        getVerification()
    }
    
}

