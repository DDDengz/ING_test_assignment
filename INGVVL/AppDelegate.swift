//
//  AppDelegate.swift
//  INGVVL
//
//  Created by Vitor Venturin Linhalis on 13/09/17.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        let navController =
            UINavigationController(rootViewController: AccountsViewController())//apiManager: AccountsAPIManager()))
        self.window?.rootViewController = navController
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

