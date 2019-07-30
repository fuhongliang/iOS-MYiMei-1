//
//  UHomeFinancialSettlementController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/30.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UHomeFinancialSettlementController: UBaseViewController {
    
    let mHomeFinancialSettlementView = UHomeFinancialSettlementView()
    
    override func configUI() {
        mHomeFinancialSettlementView.setView()
        self.view.addSubview(mHomeFinancialSettlementView)
        self.view.backgroundColor = UIColor.white
        
        mHomeFinancialSettlementView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
