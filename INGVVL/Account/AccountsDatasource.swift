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
    var itemsByCategory: [AccountType : Int] = [:]
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    
    required init(items: [T], tableView: UITableView, delegate: UITableViewDelegate) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        tableView.register(cellType: AccountTableCell.self)
        
        self.setupTableView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.itemsByCategory.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case AccountType.payment.rawValue:
            return itemsByCategory[AccountType.payment] ?? 0
        case AccountType.saving.rawValue:
            return itemsByCategory[AccountType.saving] ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: AccountTableCell.self)
        
        let account = self.items[indexPath.row]
        cell.setup(item: account)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case AccountType.saving.rawValue: return AccountType.saving.description
            case AccountType.IBA.rawValue: return AccountType.IBA.description
            case AccountType.MMDA.rawValue: return AccountType.MMDA.description
            case AccountType.CD.rawValue: return AccountType.CD.description
            default: return AccountType.payment.description
        }
    }
    
    func updateItems(items: [AccountModel], itemsByCategory: [AccountType : [Int]]) {
        self.items = items
        self.itemsByCategory = itemsByCategory
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
