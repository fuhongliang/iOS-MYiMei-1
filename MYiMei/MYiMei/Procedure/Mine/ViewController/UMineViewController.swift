//
//  UMineViewController.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UMineViewController: UBaseViewController {
    
    fileprivate var service: APIUserServices = APIUserServices()
    
    private lazy var myArray: Array = {
        return [
            [
                ["icon":"account_security", "title": "店铺数据"]
            ],
            [
                ["icon":"account_security", "title": "账号与安全"],
                ["icon":"notice_settings", "title": "消息管理"],
                ["icon":"feedback", "title": "意见反馈"],
                ["icon":"about_us", "title": "关于我们"]
            ]
        ]
    }()
    
    private lazy var head: UMineHead = {
        return UMineHead(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 2))
    }()
    
    private lazy var navigationBarY: CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: UBaseTableViewCell.self)
        tw.register(cellType: UStoreEventsCell.self)
        return tw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges).priority(.low)
            $0.top.equalToSuperview()
        }
        
        tableView.parallaxHeader.view = head
        tableView.parallaxHeader.height = 2
        tableView.parallaxHeader.minimumHeight = navigationBarY
        tableView.parallaxHeader.mode = .fill
        tableView.separatorColor = UIColor.clear
    }
    
    func goToGoodsManageMent(){
        let vc = UGoodsManagementController()
        vc.title = "商品管理"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToAccountSafe() {
        let vc = UAccountSafeController()
        vc.title = "账号与安全"
        navigationController?.pushViewController(vc, animated: true)
    }
    func goToSetUpShop() {
        let vc = USetUpShopController()
        vc.title = "店铺设置"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension UMineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return 250
        }else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = myArray[section]
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UStoreEventsCell.self)
            cell.subscribeFinancialAction = {
              
            }
            cell.subscribeGoodsManagementAction = {
                NSLog("商品管理被点击了")
                self.goToGoodsManageMent()
            }
            cell.subscribeStoreSettingsAction = {
                NSLog("店铺设置被点击了")
                self.goToSetUpShop()
            }
            cell.subscribeBusinessDataAction = {
                NSLog("经营数据被点击了")
            }
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UBaseTableViewCell.self)
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .default
            let sectionArray = myArray[indexPath.section]
            let dict: [String: String] = sectionArray[indexPath.row]
            cell.imageView?.image =  UIImage(named: dict["icon"] ?? "")
            cell.textLabel?.text = dict["title"]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            self.goToAccountSafe()
        }else if indexPath.row == 0{
            //            let vc = UModifyProfileViewController()
            //            let sectionArray = myArray[indexPath.section]
            //            let dict: [String: String] = sectionArray[indexPath.row]
            //            vc.title = dict["title"]
            //            navigationController?.pushViewController(vc, animated: true)
        }else {
            //            let vc = UModifyPasswordViewController()
            //            let sectionArray = myArray[indexPath.section]
            //            let dict: [String: String] = sectionArray[indexPath.row]
            //            vc.title = dict["title"]
            //            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    
    
    //    func showAlertControllerStyle() {
    //        let alertController = UIAlertController(title: "温馨提示", message: "是否确定退出登录？", preferredStyle: UIAlertController.Style.alert)
    //        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
    //            (action: UIAlertAction!) -> Void in
    //            self.logout()
    //        }
    //        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
    //        alertController.addAction(okAction)
    //        alertController.addAction(cancelAction)
    //        self.present(alertController, animated: true, completion: nil)
    //    }
    
    //    func logout() -> Void {
    //        let userId: String = U17User.shared.user?.userid ?? ""
    //        service.logout(userId: userId, {
    //            JPUSHService.deleteAlias({ (iResCode, iAlias, seq) in
    //                print("退出注销极光别名儿 \(iResCode),\(String(describing: iAlias)),\(seq)")
    //            }, seq: 0)
    //            (UIApplication.shared.delegate as! AppDelegate).showLoginView()
    //        }) { (FAPIErrorModel) in
    //            //            print(FAPIErrorModel.error?.localizedDescription ?? "退出失败")
    //            (UIApplication.shared.delegate as! AppDelegate).showLoginView()
    //        }
    //    }
}

