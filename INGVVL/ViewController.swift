//
//  ViewController.swift
//  INGVVL
//
//  Created by Vitor Venturin Linhalis on 13/09/17.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.parseAccounts()
    }
    
    private func parseAccounts() {
        do {
            if let file = Bundle.main.url(forResource: "mock", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                    
                    
                    /*for ac in object {
                        let name = ac["Name"].stringValue
                        let imageURL = ac["Picture"].stringValue
                        let description = ac["Description"].stringValue
                        
                        //let account = AccountModel(name: name, imageURL: NSURL(string:imageURL)!, description:description)
                        //accounts.append(fruit)
                    }
                    
                    self.tableView.reloadData()*/
                    
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


}

