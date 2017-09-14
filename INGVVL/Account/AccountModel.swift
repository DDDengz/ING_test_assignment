//
//  AccountModel.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 14/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import ObjectMapper

enum AccountType: Int {
    case payment, saving, IBA, MMDA, CD
    
    var description : String {
        switch self {
        case .payment: return "Payment Accounts"
        case .saving: return "Saving Accounts"
        case .IBA: return "Interest-Bearing Checking Accounts"
        case .MMDA: return "Money Market Deposit Accounts"
        case .CD: return "Certificates of Deposit"
        }
    }
}

struct AccountModel {
    var accountBalanceInCents: Int = 0
    var accountCurrency: String = ""
    var accountId: Int = 0
    var accountName: String = ""
    var accountNumber: String = ""
    var accountType: AccountType = .payment
    var alias: String = ""
    var isVisible: Bool = false
    var iban: String = ""
}

extension AccountModel: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        self.accountBalanceInCents <- map["accountBalanceInCents"]
        self.accountCurrency <- map["accountCurrency"]
        self.accountId <- map["accountId"]
        self.accountName <- map["accountName"]
        self.accountNumber <- map["accountNumber"]
        
        var accType:String = ""
        accType <- map["accountType"]
        switch accType {
        case "SAVING":
            self.accountType = .saving
        default:
            self.accountType = .payment
        }

        self.alias <- map["alias"]
        self.isVisible <- map["isVisible"]
        self.iban <- map["iban"]
    }
}
