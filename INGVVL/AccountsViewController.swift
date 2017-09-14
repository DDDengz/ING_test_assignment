//
//  ViewController.swift
//  INGVVL
//
//  Created by Vitor Venturin Linhalis on 13/09/17.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    var accounts: [AccountModel] = []
    
    let containerView = AccountsContainerView()
    
    /*init(apiManager: MarvelAPICalls) {
        self.apiManager = apiManager
        super.init(nibName: nil, bundle: nil)
    }*/
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountsViewController {
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
    
    /*func fetchAccounts(for query: String? = nil) {
        containerView.accountsTable.isHidden = true
        
        apiManager.characters(query: query) { acc in
            self.accounts = acc ?? []

            self.setupTableView(with: self.characters)
            }
        }
    }*/
    
    private func parseAccounts() {
        typealias JsonObject = [String: Any]
        do {
            if let file = Bundle.main.url(forResource: "mock", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? JsonObject {
                    // json is a dictionary
                    //print(object)
                    if let array = object["accounts"] as? [AccountModel] {
                        for ac in array {
                            let accountName = ac.accountName
                            let accountCurrency = ac.accountCurrency
                            let accountNumber = ac.accountNumber
                            
                            let account = AccountModel(accountBalanceInCents: 0, accountCurrency: accountCurrency, accountId: 0, accountName: accountName, accountNumber: accountNumber, accountType: "", alias: "", isVisible: false, iban: "")
                            self.accounts.append(account)
                        }
                        self.setupTableView(with: self.accounts)
                    }
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setupTableView(with accounts: [AccountModel]) {
        containerView.accountsTable.updateItems(accounts)
        //containerView.accountsTable.didSelectCharacter = { [weak self] char in
        //    self?.navigateToNextController(with: char)
        //}
    }
}

