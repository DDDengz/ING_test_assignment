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

@testable import INGVVL

class MyDelegateDatasourceTest: QuickSpec {
    
    override func spec() {
        
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