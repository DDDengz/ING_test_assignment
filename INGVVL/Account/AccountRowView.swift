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
    
    var imageThumb: UIImageView = {
        let img = UIImageView(frame: .zero)
        return img
    }()
    
    var name: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.textColor = UIColor.white
        return lb
    }()
    
    var bio: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.numberOfLines = 0
        lb.textColor = UIColor.white
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
        imageThumb.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.bottom.equalTo(self)
            make.width.equalTo(self.snp.height)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(self).offset(15)
            make.left.equalTo(imageThumb.snp.right).offset(15)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(21)
        }
        
        bio.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(8)
            make.left.equalTo(imageThumb.snp.right).offset(15)
            make.right.equalTo(self).offset(-15)
            make.bottom.equalTo(self).offset(-15)
        }
    }
    
    func buildViewHierarchy() {
        self.addSubview(imageThumb)
        self.addSubview(name)
        self.addSubview(bio)
    }
}

