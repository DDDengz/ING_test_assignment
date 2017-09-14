//
//  FirstSpec.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 14/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import Foundation
import Nimble
import Quick

@testable import INGVVL

class FirstSpec: QuickSpec {
    override func spec() {
        describe("First Simple Spec") {
            it("Should be true") {
                expect(true).to(beTruthy())
            }
        }
    }
}
