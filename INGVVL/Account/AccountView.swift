//
//  AccountView.swift
//  INGVVL
//
//  Created by Vitor Venturin on 18/12/16.
//  Copyright © 2016 Vitor Venturin. All rights reserved.
//

import UIKit

class AccountView: UIView {
    var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorPalette.dark
        view.alpha = CGFloat(0.85)
        return view
    }()
    
    var iban: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.numberOfLines = 0
        lb.textColor = ColorPalette.clean
        return lb
    }()
    
    var currency: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.numberOfLines = 0
        lb.textColor = ColorPalette.clean
        return lb
    }()
    
    var saldo: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.numberOfLines = 0
        lb.textColor = ColorPalette.clean
        return lb
    }()
    
    var productName: UILabel = {
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

extension AccountView: ViewConfiguration {
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        
        iban.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(80)
            make.left.equalTo(containerView).offset(20)
            make.right.equalTo(containerView)
        }
        
        currency.snp.makeConstraints { make in
            make.top.equalTo(iban).offset(32)
            make.left.equalTo(containerView).offset(20)
            make.right.equalTo(containerView)
        }
        
        saldo.snp.makeConstraints { make in
            make.top.equalTo(currency).offset(32)
            make.left.equalTo(containerView).offset(20)
            make.right.equalTo(containerView)
        }
        
        productName.snp.makeConstraints { make in
            make.top.equalTo(saldo).offset(32)
            make.left.equalTo(containerView).offset(20)
            make.right.equalTo(containerView)
        }
    }
    
    func buildViewHierarchy() {
        containerView.addSubview(iban)
        containerView.addSubview(currency)
        containerView.addSubview(saldo)
        containerView.addSubview(productName)
        self.addSubview(containerView)
    }
    
    func configureViews(){
        self.backgroundColor = ColorPalette.dark
    }
}

extension AccountView {
    func setup(with account: AccountModel) {
        iban.text = account.iban.isEmpty ? "(IBAN inexistent)" : "IBAN: \(account.iban)"
        currency.text = account.accountCurrency.isEmpty ? "(?)" : "Currency: \(account.accountCurrency)"
        saldo.text = "Saldo: \(account.accountBalanceInCents)"
        if let name = account.productName {
            productName.text = name.isEmpty ? "" : "Product name: \(name)"
        }
    }
}
