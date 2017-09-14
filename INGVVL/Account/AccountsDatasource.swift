//
//  AccountsDatasource.swift
//  INGVVL
//
//  Created by Vitor Venturin on 14/09/17.
//  Copyright © 2017 Vitor Venturin. All rights reserved.
//

import UIKit

class AccountsDatasource: NSObject, ItemsTableViewDatasource {
    
    var items:[AccountModel] = []
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    
    required init(items: [AccountModel], tableView: UITableView, delegate: UITableViewDelegate) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        tableView.register(cellType: AccountTableCell.self)
        self.setupTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: AccountTableCell.self)
        
        let account = self.items[indexPath.row]
        cell.setup(item: account)
        return cell
    }
    
    func updateItems(_ items: [AccountModel]) {
        self.items = items
        self.tableView?.reloadData()
    }
}

protocol AccountsDelegate {
    func didSelectAccount(at index: IndexPath)
}

class AccountsTableDelegate: NSObject, UITableViewDelegate {
    let delegate: AccountsDelegate
    
    init(_ delegate: AccountsDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AccountTableCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectAccount(at: indexPath)
    }
}