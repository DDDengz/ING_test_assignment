//
//  AccountModel.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 14/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import ObjectMapper

struct AccountModel {
    var accountBalanceInCents: Int = 0
    var accountCurrency: String = ""
    var accountId: Int = 0
    var accountName: String = ""
    var accountNumber: Int = 0
    var accountType: String = ""
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
        self.accountType <- map["accountType"]
        self.alias <- map["alias"]
        self.isVisible <- map["isVisible"]
        self.iban <- map["iban"]
    }
}
