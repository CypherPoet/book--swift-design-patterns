//: [Previous](@previous)

import UIKit


struct Cafe {
    
    /**
     "public private(set)" means that everyone can read, but only methods
     of the class itself can make changes
     */
    public private(set) var bestSellingCoffee = "Sumatra"
}


/// Version of `Cafe` that uses getters and setters
struct Cafe2 {
    private var _bestSellingCoffee = "Sumatra"
    
    public private(set) var bestSellingCoffee: String {
        get {
            return _bestSellingCoffee
        }
        set {
            _bestSellingCoffee = newValue
        }
    }
    
    
    /**
     For lazy properties, we can write a setter closure that gets
     immediately applied when the property is first read.
     
     Swift generates the getter automatically, because it’s
     just a matter of returning what was calculated in the setter.
     */
    lazy var revenue: Int = {
        return Int.random(in: 1_000...21_000_000)
    }()
}


var cafe = Cafe2()

cafe.bestSellingCoffee
cafe.revenue
cafe.revenue


//: [Next](@next)
