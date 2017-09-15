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
    var response: ResponseModel?
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
        self.navigationItem.rightBarButtonItems = [
            NavigationItems.hide(self, #selector(hide(_:))).button()
        ]
    }
    
    private func parseAccounts() {
        do {
            if let file = Bundle.main.url(forResource: "mock", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String : Any] {
                    if let response = Mapper<ResponseModel>().map(JSON: object) {
                        self.response = response
                        categorizeAccounts(response, showAll: true)
                    }
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func categorizeAccounts(_ response: ResponseModel, showAll: Bool) {
        var accounts: [AccountModel] = []
        for account in response.accounts {
            if !showAll && !account.isVisible {
               continue
            }
            accounts.append(account)
        }
        
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
    
    func show(_ sender: UIButton) {
        if let response = response {
            categorizeAccounts(response, showAll: true)
        }
        self.navigationItem.rightBarButtonItems = [
            NavigationItems.hide(self, #selector(hide(_:))).button()
        ]
    }
    
    func hide(_ sender: UIButton) {
        if let response = response {
            categorizeAccounts(response, showAll: false)
        }
        self.navigationItem.rightBarButtonItems = [
            NavigationItems.show(self, #selector(show(_:))).button()
        ]
    }
}

