//
//  UIView+MakeThemeable.swift
//  ThemeSwitching
//
//  Created by Brian Sipple on 3/30/19.
//  Copyright © 2019 Brian Sipple. All rights reserved.
//

import UIKit

extension UIView {
    @objc func makeThemeable() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(enableDarkTheme),
            name: .HWSThemeDidChange,
            object: nil
        )
    }
    
    @objc func enableDarkTheme() {
        backgroundColor = #colorLiteral(red: 0.1557853222, green: 0.1640332043, blue: 0.2117108405, alpha: 1)
    }
}
