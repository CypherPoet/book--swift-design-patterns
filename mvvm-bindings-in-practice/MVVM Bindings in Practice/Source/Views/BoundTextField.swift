//
//  BoundTextField.swift
//  MVVM Bindings in Practice
//
//  Created by Brian Sipple on 3/20/19.
//  Copyright © 2019 Brian Sipple. All rights reserved.
//

import UIKit

class BoundTextField: UITextField {
    var valueChanged: (() -> Void)?
    
    @objc func handeValueChange() {
        valueChanged?()
    }
    
    func bind(to observableValue: Observable<String>) {
        addTarget(self, action: #selector(handeValueChange), for: .editingChanged)
        
        /// Bind direction 1: tell the `observableValue` that our text has changed
        valueChanged = { [weak self] in
            observableValue.bindingChanged(to: self?.text ?? "")
        }

        /// Bind direction 2: Let the `observableValue` know how to update our text
        observableValue.valueChanged = { [weak self] (newValue: String?) in
            self?.text = newValue
        }
    }
}
