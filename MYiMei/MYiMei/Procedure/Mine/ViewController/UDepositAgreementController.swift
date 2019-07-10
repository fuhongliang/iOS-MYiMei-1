//
//  UDepositAgreementController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol UDepositAgreementViewDelegate: AnyObject {
    func agree()
}

class UDepositAgreementController: UBaseViewController {
    
    let depositAgreementView = UDepositAgreementView()
    
    var title：String = "保证金协议声明"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configUI() {
        depositAgreementView.configUI()
        depositAgreementView.delegate = self
        self.view.addSubview(depositAgreementView)
        if let request = getUrl() {
            depositAgreementView.wkWebView.load(request)
        }
        
        depositAgreementView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    //MARK:网络请求
    func getUrl() -> URLRequest? {
        
        if let url = URL(string:"http://www.baidu.com") {
            return URLRequest(url: url)
        }
        return nil
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "温馨提示", message: "您还未同意保证金协议", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default,handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension UDepositAgreementController: UDepositAgreementViewDelegate {
    //MARK:申请入驻
    func agree() {
        if (!depositAgreementView.checkButton.isSelected) {
            showAlert()
        } else {
            let vc = UMechJoinViewController()
            vc.title = "缴纳保证金"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
   
}

