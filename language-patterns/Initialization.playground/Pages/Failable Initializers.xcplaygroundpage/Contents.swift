//: [Previous](@previous)

import Foundation


/**
 One particularly advanced feature of Swift is the ability to override a
 failable initializer with a nonfailable initializer.
 
 That is, while the parent class’s initializer might return nil, you can
 create create a new subclass with the same initializer that won’t return nil.
 */

class Species {
    var name: String?
 

    init() {}

    init?(name: String) {
        if name.isEmpty { return nil }
        
        self.name = name
    }
}


let newDiscovery = Species()
let bear = Species(name: "Bear")
let oops = Species(name: "")

print(newDiscovery)
print(bear)
print(oops)


class Bear: Species {
    override init(name: String) {
        super.init()
        
        self.name = name.isEmpty ? "Bear" : name
    }
}


//let newDiscovery2 = Bear()
let bear2 = Bear(name: "")
let bear3 = Bear(name: "Black Bear")

print(bear2)
print(bear3)


/**
    ⚠️ While it's possible to override a failable initializer with a non-failable initializer,
    the opposite is not true.
 */


//: [Next](@next)
