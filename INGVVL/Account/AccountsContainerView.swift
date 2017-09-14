//
//  AccountsContainerView.swift
//  INGVVL
//
//  Created by Vitor Venturin on 14/09/17.
//  Copyright © 2017 Vitor Venturin. All rights reserved.
//

import UIKit

class AccountsContainerView: UIView {
    let accountsTable = AccountsTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension AccountsContainerView: ViewConfiguration {
    func setupConstraints() {
        accountsTable.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
    
    func buildViewHierarchy() {
        self.addSubview(accountsTable)
    }
    
    func configureViews(){
        self.backgroundColor = UIColor.black
    }
}
