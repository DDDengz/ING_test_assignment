//
//  MyDelegateDatasourceTest.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 14/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import XCTest
import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import INGVVL

class MyDelegateDatasourceTest: QuickSpec {
    
    override func spec() {
        let sizes = ["SmallSize": CGSize(width: 44, height: 44),
                     "MediumSize": CGSize(width: 88, height: 88),
                     "LargeSize": CGSize(width: 320, height: 320)]
        var myDelegateDatasource: MyDelegateDatasource!
        let myDelegate = MyDelegateDatasourceMock()
        var tableView: UITableView!
        
        describe("MyDelegateDatasource") {
            
            beforeEach {
                let data = ["Vitor", "Venturin", "Testing", "Delegate", "Datasource"]
                myDelegateDatasource = MyDelegateDatasource()
                
                myDelegateDatasource.data = data
                myDelegateDatasource.delegate = myDelegate
                
                tableView = UITableView()
                tableView.register(UITableViewCell.self,
                                   forCellReuseIdentifier: "Cell")
                tableView.dataSource = myDelegateDatasource
                tableView.delegate = myDelegateDatasource
            }
            
            //MARK: Datasource
            
            it("should return the right number of rows") {
                expect(myDelegateDatasource.tableView(tableView, numberOfRowsInSection: 0)) == 5
            }
            
            it("should return the right number of sections") {
                expect(myDelegateDatasource.numberOfSections(in: tableView)) == 1
            }
            
            it("should return Vitor view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 0, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                //expect(cell).to(haveValidDynamicSizeSnapshot(sizes: sizes))
                expect(cell).to(haveValidSnapshot(named: nil, usesDrawRect: false, tolerance: 320.0))
                
                expect(cell) == snapshot()
            }
            
            it("should return Venturin view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 1, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                expect(cell).to(haveValidSnapshot(named: nil, usesDrawRect: false, tolerance: 320.0))
                
                expect(cell) == snapshot()
            }
            
            it("should return Testing view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 2, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                expect(cell).to(haveValidSnapshot(named: nil, usesDrawRect: false, tolerance: 320.0))
                
                expect(cell) == snapshot()
            }
            
            it("should return Delegate view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 3, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                expect(cell).to(haveValidSnapshot(named: nil, usesDrawRect: false, tolerance: 320.0))
                
                expect(cell) == snapshot()
            }
            
            it("should return Datasoruce view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 4, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                expect(cell).to(haveValidSnapshot(named: nil, usesDrawRect: false, tolerance: 320.0))
                
                expect(cell) == snapshot()
            }
            
            //MARK: Delegate
            
            it("should return Vitor if user select first Cell") {
                let indexPath = IndexPath(row: 0, section: 0)
                
                expect(myDelegate.didSelectCell) == false
                
                myDelegateDatasource.tableView(tableView, didSelectRowAt: indexPath)
                expect(myDelegate.didSelectCell) == true
                expect(myDelegate.data!) == "Vitor"
            }
        }
    }
}
