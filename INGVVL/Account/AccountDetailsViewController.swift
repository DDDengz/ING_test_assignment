//
//  AccountDetailsViewController.swift
//  INGVVL
//
//  Created by Vitor Venturin on 14/11/16.
//  Copyright © 2016 Vitor Venturin. All rights reserved.
//

import UIKit

class AccountDetailsViewController: UIViewController {
    let accountView = AccountView()
    let account: AccountModel
    
    
    init(account: AccountModel) {
        self.account = account
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = accountView
    }
}

extension AccountDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        accountView.setup(with: account)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = account.accountNumber
    }
}
