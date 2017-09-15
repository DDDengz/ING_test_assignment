//
//  AccountsContainerViewSpec.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 15/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import INGVVL

class AccountsContainerViewSpec: QuickSpec {
    override func spec() {
        describe("an Account Container View ") {
            var container: AccountsContainerView!
            
            
            beforeEach {
                container = AccountsContainerView()
            }
            
            it("should trigger fatal error if init with coder") {
                expect { () -> Void in
                    let _ = AccountsContainerView(coder: NSCoder())
                    }.to(throwAssertion())
            }
            
            it("should have expected background color") {
                expect(container.backgroundColor == ColorPalette.dark).to(beTruthy())
            }
            
            it("should have expected number of subviews") {
                let subviews = container.subviews
                expect(subviews.count).to(equal(1))
            }
            
            it("should have expected subviews") {
                let subviews = container.subviews
                expect(subviews[0]).to(beAKindOf(AccountsTableView.self))
            }
            
        }
    }
}
