//
//  AccountsTableView.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 14/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit

class AccountsTableView: UITableView {

    var didSelectAccount: ((AccountModel) -> Void)?
    
    fileprivate var customDatasource: AccountsDatasource?
    fileprivate var customDelegate: AccountsTableDelegate?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        customDelegate = AccountsTableDelegate(self)
        customDatasource = AccountsDatasource(items: [],
                                                tableView: self,
                                                delegate: customDelegate!)
        self.backgroundColor = ColorPalette.dark
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountsTableView {
    func updateItems(_ items: [AccountModel]) {
        customDatasource?.updateItems(items)
    }
}

extension AccountsTableView: AccountsDelegate {
    func didSelectAccount(at index: IndexPath) {
        let itemsCount = numberOfRows(inSection: 0)
        guard itemsCount > index.row else {
            return
        }
        if let char = customDatasource?.items[index.row] {
            didSelectAccount?(char)
        }
    }
}
