//
//  NavigationItems.swift
//  INGVVL
//
//  Created by Vitor Linhalis on 15/09/2017.
//  Copyright © 2017 Vitor Venturin Linhalis. All rights reserved.
//

import UIKit

enum NavigationItems {
    case show(Any, Selector)
    case hide(Any, Selector)
    
    func button() -> UIBarButtonItem {
        switch self {
        case .show(let target, let selector):
            return UIBarButtonItem(image: UIImage(named: "Show"), style: .plain, target: target, action: selector)
        case .hide(let target, let selector):
            return UIBarButtonItem(image: UIImage(named: "Hide"), style: .plain, target: target, action: selector)
        }
    }
}
