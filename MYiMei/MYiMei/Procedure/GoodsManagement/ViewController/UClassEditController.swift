//
//  UClassEditController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UClassEditController: UBaseViewController {
    
    let classEditView = UClassEditView()
    
    var title：String = "新建分类"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classEditView.configUI()
        self.view.addSubview(classEditView)
        classEditView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    
    
}

