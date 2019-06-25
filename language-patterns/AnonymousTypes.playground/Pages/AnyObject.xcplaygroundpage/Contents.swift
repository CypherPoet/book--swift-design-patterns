//: [Previous](@previous)

import UIKit

let name = "CypherPoet" as AnyObject

print("\(name.count)")
print("\((name as! String).count)")

// print(name.viewControllers)  // lol

class ExpensiveObjectClass {}

let cache = NSCache<NSString, ExpensiveObjectClass>()


let bigDeal: ExpensiveObjectClass

if let cachedBigDeal = cache.object(forKey: "bfd") {
    bigDeal = cachedBigDeal
} else {
    bigDeal = ExpensiveObjectClass()
    cache.setObject(bigDeal, forKey: "bfd")
}

//: [Next](@next)
