//
//  MyDatasource.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 14/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit

protocol MyDelegateDatasourceProtocol {
    func didSelectCell(data: String)
}

class MyDelegateDatasource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var data: [String]?
    var delegate: MyDelegateDatasourceProtocol?
    
    //MARK: Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = data?.count {
            return count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data?[indexPath.row]
        
        return cell
    }
    
    //MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = data?[indexPath.row] {
            delegate?.didSelectCell(data: data)
        }
    }
}
