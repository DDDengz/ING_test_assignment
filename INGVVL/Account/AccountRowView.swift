//
//  AccountRowView.swift
//  INGVVL
//
//  Created by Vitor Venturin on 18/12/16.
//  Copyright © 2017 Vitor Venturin. All rights reserved.
//

import UIKit
import SnapKit

class AccountRowView: UIView {
    var number: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.textColor = ColorPalette.clean
        return lb
    }()
    
    var iban: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.numberOfLines = 0
        lb.textColor = ColorPalette.clean
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountRowView: ViewConfiguration {
    func setupConstraints() {
        number.snp.makeConstraints { make in
            make.top.equalTo(self).offset(15)
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(21)
        }
        
        iban.snp.makeConstraints { make in
            make.top.equalTo(number.snp.bottom).offset(8)
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.bottom.equalTo(self).offset(-15)
        }
    }
    
    func buildViewHierarchy() {
        self.addSubview(number)
        self.addSubview(iban)
    }
}

