//
//  USetUpShopController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/5.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class USetUpShopController: UBaseViewController {
    
    private lazy var myArray: Array = {
        return [
            [
                ["instructions":"店铺名字"],
                ["instructions":"店铺分类"]
            ],
            [
                ["instructions":"店铺头像"],
                ["instructions":"联系人"],
                ["instructions":"联系电话"],
                ["instructions":"客服电话"],
                ["instructions":"所在地区"],
                ["instructions":"详细地址"]
            ],
            [
                ["instructions":"店铺背景（顶部）"]
            ]
        ]
    }()
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0)
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: UShopLabelCell.self)
        tw.register(cellType: UShopLabelImgCell.self)
        tw.register(cellType: UShopLabelNotArrowCell.self)
        return tw
    }()
    
    var title：String = "店铺设置"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
}
extension USetUpShopController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    //MARK:cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 2 || indexPath.section == 1 && indexPath.row == 0){
            return 55
        }else{
            return 44
        }
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = myArray[section]
        return sectionArray.count
    }
    
    //MARK:cell数量
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 1){
            
            if(indexPath.row == 0){
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UShopLabelImgCell.self)
//                cell.accessoryType = .disclosureIndicator
                cell.selectionStyle = .default
                let sectionArray = myArray[indexPath.section]
                let dict: [String: String] = sectionArray[indexPath.row]
                cell.instructionsLabel.text = dict["instructions"]
                //店铺地址、分类数据没写
                return cell
            } else if(indexPath.row == 4) {
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UShopLabelNotArrowCell.self)
                cell.selectionStyle = .default
                let sectionArray = myArray[indexPath.section]
                let dict: [String: String] = sectionArray[indexPath.row]
                cell.instructionsLabel.text = dict["instructions"]
                //店铺地址、分类数据没写
                return cell
            } else{
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UShopLabelCell.self)
//                cell.accessoryType = .disclosureIndicator
                cell.selectionStyle = .default
                let sectionArray = myArray[indexPath.section]
                let dict: [String: String] = sectionArray[indexPath.row]
                cell.instructionsLabel.text = dict["instructions"]
                //店铺地址、分类数据没写
                return cell
            }
          
        } else if (indexPath.section == 2){
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UShopLabelImgCell.self)
//            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .default
            let sectionArray = myArray[indexPath.section]
            let dict: [String: String] = sectionArray[indexPath.row]
            cell.instructionsLabel.text = dict["instructions"]
            //图片数据对应没写
            return cell
        } else {
            if (indexPath.row == 1) {
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UShopLabelNotArrowCell.self)
                //cell.accessoryType = .disclosureIndicator
                cell.selectionStyle = .default
                let sectionArray = myArray[indexPath.section]
                let dict: [String: String] = sectionArray[indexPath.row]
                cell.instructionsLabel.text = dict["instructions"]
                //店铺信息没写
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UShopLabelCell.self)
//                cell.accessoryType = .disclosureIndicator
                cell.selectionStyle = .default
                let sectionArray = myArray[indexPath.section]
                let dict: [String: String] = sectionArray[indexPath.row]
                cell.instructionsLabel.text = dict["instructions"]
                //店铺信息没写
                return cell
            }
        }
        
    }
    
    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            
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
   
}
