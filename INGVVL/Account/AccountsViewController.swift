//
//  ViewController.swift
//  INGVVL
//
//  Created by Vitor Venturin Linhalis on 13/09/17.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import ObjectMapper

protocol ItemsByCategoryProtocol {
    func setupTableView(accounts: [AccountModel], itemsByCategory: [AccountType : [Int]])
}

class AccountsViewController: UIViewController {
    let containerView = AccountsContainerView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountsViewController : ItemsByCategoryProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationItem()
        self.parseAccounts()
    }
    
    override func loadView() {
        self.view = containerView
    }
    
    func setupNavigationItem() {
        self.navigationItem.title = "Accounts"
    }
    
    private func parseAccounts() {
        do {
            if let file = Bundle.main.url(forResource: "mock", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String : Any] {
                    var accounts: [AccountModel] = []
                    let response = Mapper<ResponseModel>().map(JSON: object)
                    response?.accounts.forEach({ (account) in
                        accounts.append(account)
                    })
                    
                    //categorize the type of accounts for table sections using an array of indexes:
                    var itemsByCategory: [AccountType : [Int]] = [:]
                    for (index, item) in accounts.enumerated() {
                        if (itemsByCategory[item.accountType] == nil) {
                            itemsByCategory[item.accountType] = []
                        }
                        itemsByCategory[item.accountType]?.append(index)
                    }
                    
                    self.setupTableView(accounts: accounts, itemsByCategory: itemsByCategory)
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setupTableView(accounts: [AccountModel], itemsByCategory: [AccountType : [Int]]) {
        containerView.accountsTable.updateItems(items: accounts, itemsByCategory: itemsByCategory)
        containerView.accountsTable.didSelectAccount = { [weak self] acc in
            self?.navigateToNextController(with: acc)
        }
    }
    
    func navigateToNextController(with account: AccountModel) {
        let nextController = AccountDetailsViewController(account: account)
        self.navigationController?.pushViewController(nextController, animated: true)
    }
}

