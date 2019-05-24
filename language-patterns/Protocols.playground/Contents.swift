import UIKit

protocol Identifiable {
    associatedtype IDType
    
    var id: IDType { get set }
}


struct Spaceship: Identifiable {
    var id: Int
}


struct Wallet: Identifiable {
    var id: String
}

/**
    Protocols with associated tyeps cannot be used generically, because Swift doesn’t understand
    what that means.
 
    That's because a PAT is an incomplete protocol – it has a hole in that must be
    filled by whatever conforms to it. So if you have an array of incomplete protocols,
    they could potentially all be completed in entirely different ways.
 */
// let coldStorage: Identifiable = Wallet(id: "0x234a")
