//
//  AccountTableCell.swift
//  INGVVL
//
//  Created by Vitor Venturin on 15/11/16.
//  Copyright © 2016 Vitor Venturin. All rights reserved.
//

import UIKit
import Reusable

final class AccountTableCell: UITableViewCell {
    var accountRow = AccountRowView()
    
    static func height() -> CGFloat {
        return 80
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(item: AccountModel) {
        accountRow.number.text = item.accountNumber
        accountRow.iban.text = item.iban
    }
}

extension AccountTableCell: Reusable {
}

extension AccountTableCell: ViewConfiguration {
    func setupConstraints() {
        accountRow.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
            
        }
    }
    
    func buildViewHierarchy() {
        self.contentView.addSubview(accountRow)
    }
    
    func configureViews() {
        accountRow.number.textColor = ColorPalette.clean
        accountRow.iban.textColor = ColorPalette.cleanMedium
        self.contentView.backgroundColor = ColorPalette.dark
        self.selectionStyle = .none
    }
}
