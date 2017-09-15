//
//  AccountTableCellSpec.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 15/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import INGVVL

class AccountTableCellSpec: QuickSpec {
    override func spec() {
        describe("an Account Table Cell ") {
            var cell: AccountTableCell!
            var account: AccountModel!
            var accountsViewController: AccountsViewController!
            
            beforeEach {
                accountsViewController = AccountsViewController()
                accountsViewController.parseAccounts()
                
                cell = AccountTableCell(style: .default, reuseIdentifier:
                    "AccountTableCell")
                account = accountsViewController.accounts[0]
                
                cell.setup(item: account)
            }
            
            it("should not be nil") {
                expect(cell).toNot(beNil())
                expect(cell.accountRow).toNot(beNil())
            }
            
            it("should have expected height") {
                expect(AccountTableCell.height()).to(equal(80))
            }
            
            it("should have expected background color") {
                expect(cell.accountRow.number.textColor).to(equal(ColorPalette.clean))
            }
            
            it("should have expected text color") {
                expect(cell.contentView.backgroundColor).to(equal(ColorPalette.dark))
            }
            
            it("should have expected selection style") {
                expect(cell.selectionStyle == .none).to(beTruthy())
            }
            
            it("should have expected name after setup") {
                expect(cell.accountRow.number.text).to(equal(account!.accountNumber))
            }
            
            it("should trigger fatal error if init with coder") {
                expect { () -> Void in
                    let _ = AccountTableCell(coder: NSCoder())
                    }.to(throwAssertion())
            }
            
        }
    }
}
