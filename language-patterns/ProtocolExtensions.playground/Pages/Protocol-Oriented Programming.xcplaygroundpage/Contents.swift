//: [Previous](@previous)

import Foundation

protocol StoreItem {
    var name: String { get set }
}

protocol Purchaseable: StoreItem {
    var price: Decimal { get set }
    
    func purchase()
}

extension Purchaseable {
    func purchase() {
        print("Bought \(name)!")
    }
}


protocol Printable: StoreItem {
    var printFile: URL { get set }
    
    func printOut()
}

extension Printable {
    func printOut() {
        print("Printing \(name)...")
    }
}


protocol Borrowable: StoreItem {
    var borrowers: [String] { get set }
    
    mutating func lend(to: String)
}

extension Borrowable {
    mutating func lend(to lenderName: String) {
        print("Lending \(name) to \(lenderName)")
    }
}


protocol Listenable: StoreItem {
    var audioFile: URL { get set }
    
    func playPreview()
}

extension Listenable {
    func playPreview() {
        print("Previewing \(name)...")
    }
}


struct Book:
    Purchaseable,
    Printable,
    Borrowable
{
    var name: String
    var price: Decimal
    var printFile: URL
    var borrowers: [String]
}


/**
    With JUST a `Book` struct, POP doesn't give us much. But let's keep going...
 */

struct AudioBook:
    Purchaseable,
    Listenable,
    Borrowable
{
    var name: String
    var price: Decimal
    var audioFile: URL
    var borrowers: [String]
}


struct Podcast: Listenable {
    var name: String
    var audioFile: URL
    var duration: Int
}


//: [Next](@next)



let pod = Podcast(name: "Noded", audioFile: URL(string: "noded-1.mp4")!, duration: 120)

print(pod.playPreview())
