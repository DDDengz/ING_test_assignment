//
//  AccountRowViewSpec.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 15/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import INGVVL

class AccountRowViewSpec: QuickSpec {
    override func spec() {
        describe("an Account Row View ") {
            var container: AccountRowView!
            
            beforeEach {
                container = AccountRowView()
            }
            
            it("should trigger fatal error if init with coder") {
                expect { () -> Void in
                    let _ = AccountRowView(coder: NSCoder())
                    }.to(throwAssertion())
            }
            
            it("should have expected number of subviews") {
                let subviews = container.subviews
                expect(subviews.count).to(equal(2))
            }
            
            it("should have expected subviews") {
                let subviews = container.subviews
                expect(subviews[0]).to(beAKindOf(UILabel.self))
                expect(subviews[1]).to(beAKindOf(UILabel.self))
            }
        }
    }
}
