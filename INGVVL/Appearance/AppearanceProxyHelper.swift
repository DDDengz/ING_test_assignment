//
//  AppearanceProxyHelper.swift
//  INGVVL
//
//  Created by Vitor Venturin on 11/12/16.
//  Copyright © 2016 Vitor Venturin. All rights reserved.
//

import Foundation
import UIKit

struct ApperanceProxyHelper {    
    static func customizeNavigationBar() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = ColorPalette.clean
        navigationBarAppearace.barTintColor = ColorPalette.primary
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:ColorPalette.clean]
    }
    
}


