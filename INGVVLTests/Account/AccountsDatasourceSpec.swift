//
//  AccountsDatasourceSpec.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 15/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import INGVVL

class TableViewDelegateMock: NSObject, UITableViewDelegate {
    
}

class AccountsDatasourceSpec: QuickSpec {
    override func spec() {
        describe("an AccountsDatasource ") {
            var datasource: AccountsDatasource!
            var account: AccountModel!
            var tableView: UITableView!
            var accountsViewController: AccountsViewController!
            
            beforeEach {
                accountsViewController = AccountsViewController()
                accountsViewController.parseAccounts()
                account = accountsViewController.accounts[0]
                
                tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
                datasource = AccountsDatasource(items: [account!], tableView: tableView, delegate: TableViewDelegateMock())
            }
            
            it("should have a valid datasource") {
                expect(datasource).toNot(beNil())
            }
            
            it("should have the expected number of items") {
                let count = datasource.tableView(tableView, numberOfRowsInSection: 0)
                expect(count).to(equal(0))
            }
            
            it("should have be able to update items") {
                datasource.updateItems(items: [account!, account!, account!], itemsByCategory: [AccountType.payment : [0,1,2]])
                let count = datasource.tableView(tableView, numberOfRowsInSection: 0)
                expect(count).to(equal(3))
            }
        }
    }
}
