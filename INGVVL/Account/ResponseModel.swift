//
//  ResponseModel.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 14/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import ObjectMapper

struct ResponseModel {
    var accounts: [AccountModel] = []
    var failedAccountTypes: String = ""
    var returnCode: String = ""
}

extension ResponseModel: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        self.accounts <- map["accounts"]
        self.failedAccountTypes <- map["failedAccountTypes"]
        self.returnCode <- map["returnCode"]
    }
}
