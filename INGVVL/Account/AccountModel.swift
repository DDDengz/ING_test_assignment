//
//  AccountModel.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 14/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit

struct AccountModel {
    typealias JsonObject = [String: Any]
    
    let accountBalanceInCents: Int
    let accountCurrency: String
    let accountId: Int
    let accountName: String
    let accountNumber: Int
    let accountType: String
    let alias: String
    let isVisible: Bool
    let iban: String
    
    init?(json: JsonObject) {
        guard let accountBalanceInCents = json["accountBalanceInCents"] as? Int else {
            return nil
        }
        
        guard let accountCurrency = json["accountCurrency"] as? String else {
            return nil
        }
        
        guard let accountId = json["accountId"] as? Int else {
            return nil
        }
        
        guard let accountName = json["accountName"] as? String else {
            return nil
        }
        
        guard let accountNumber = json["accountNumber"] as? Int else {
            return nil
        }
        
        guard let accountType = json["accountType"] as? String else {
            return nil
        }
        
        guard let alias = json["alias"] as? String else {
            return nil
        }
        
        guard let isVisible = json["isVisible"] as? Bool else {
            return nil
        }
        
        guard let iban = json["iban"] as? String else {
            return nil
        }
        
        self.accountBalanceInCents = accountBalanceInCents
        self.accountCurrency = accountCurrency
        self.accountId = accountId
        self.accountName = accountName
        self.accountNumber = accountNumber
        self.accountType = accountType
        self.alias = alias
        self.isVisible = isVisible
        self.iban = iban
    }
}
