//
//  ViewConfiguration.swift
//  INGVVL
//
//  Created by Vitor Venturin on 18/12/16.
//  Copyright © 2016 Vitor Venturin. All rights reserved.
//

import Foundation

protocol ViewConfiguration: class {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {
    }
}
