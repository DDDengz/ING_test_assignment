//
//  AccountView.swift
//  INGVVL
//
//  Created by Vitor Venturin on 18/12/16.
//  Copyright © 2016 Vitor Venturin. All rights reserved.
//

import UIKit

class AccountView: UIView {
    /*var image: UIImageView = {
        let img = UIImageView(frame: .zero)
        return img
    }()*/
    
    var containerView: UIView = {
        let lb = UIView(frame: .zero)
        lb.backgroundColor = ColorPalette.dark
        lb.alpha = CGFloat(0.85)
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

extension AccountView: ViewConfiguration {
    func setupConstraints() {
        /*image.snp.makeConstraints { make in
            make.top.equalTo(self).offset(64)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(350)
        }*/
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        
        iban.snp.makeConstraints { make in
            make.edges.equalTo(containerView).inset(UIEdgeInsetsMake(15, 15, 15, 15))
        }
    }
    
    func buildViewHierarchy() {
        //self.addSubview(image)
        containerView.addSubview(iban)
        self.addSubview(containerView)
    }
    
    func configureViews(){
        self.backgroundColor = ColorPalette.dark
    }
}

extension AccountView {
    func setup(with account: AccountModel) {
        iban.text = account.iban.isEmpty ? "No IBAN" : account.iban
        /*if let imagePath = account.thumImage?.fullPath() {
            image.download(image: imagePath)
        }*/
    }
}
