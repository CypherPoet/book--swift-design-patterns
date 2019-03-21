//
//  Observable.swift
//  MVVM Bindings in Practice
//
//  Created by Brian Sipple on 3/20/19.
//  Copyright © 2019 Brian Sipple. All rights reserved.
//

import Foundation

class Observable<ObservedType> {
    private var _value: ObservedType?
    
    var valueChanged: ((ObservedType?) -> Void)?
    
    
    init(_ value: ObservedType) {
        _value = value
    }
    
    
    var value: ObservedType? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("Value is now \(newValue)")
    }
}
