//
//  TodayViewController.swift
//  INGTodayWidget
//
//  Created by Vitor Linhalis on 15/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import NotificationCenter
import ObjectMapper

class TodayViewController: UIViewController, NCWidgetProviding {
    var response: ResponseModel?
    let containerView = AccountsContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded
        self.view.backgroundColor = ColorPalette.primary
        
        self.parseAccounts()
    }
    
    override func loadView() {
        self.view = containerView
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
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
}
