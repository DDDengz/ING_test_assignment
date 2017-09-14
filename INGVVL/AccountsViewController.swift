//
//  ViewController.swift
//  INGVVL
//
//  Created by Vitor Venturin Linhalis on 13/09/17.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import ObjectMapper

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
    
    private func parseAccounts() {
        do {
            if let file = Bundle.main.url(forResource: "mock", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                let account = Mapper<AccountModel>().mapArray(JSONArray: json["accounts"])
                print(account ?? "buceta")
                self.setupTableView(with: self.accounts)
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

