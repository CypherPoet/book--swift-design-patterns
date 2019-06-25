//
//  TouchesBegan.swift
//  ResponderChainDemo
//
//  Created by Brian Sipple on 6/6/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import UIKit


extension UIView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIView::touchesBegan")
        next?.touchesBegan(touches, with: event)
    }
}


extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIViewController::touchesBegan")
        next?.touchesBegan(touches, with: event)
    }
}


extension UIWindow {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIWindow::touchesBegan")
        next?.touchesBegan(touches, with: event)
    }
}


extension AppDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AppDelegate::touchesBegan")
        next?.touchesBegan(touches, with: event)
    }
}
