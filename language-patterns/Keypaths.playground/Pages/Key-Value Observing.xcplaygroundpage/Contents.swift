//: [Previous](@previous)

import Foundation

let cafe = Cafe()

cafe.observe(\Cafe.remainingMugs, options: [.new]) { (cafe, change) in
    print("remainingMugs changed: \(cafe.remainingMugs)")
}

print(cafe.remainingMugs)
cafe.remainingMugs += 1

//: [Next](@next)
