//: [Previous](@previous)

import Foundation


struct Book: Identifiable {
    static let idKeyPath: WritableKeyPath<Book, String> = \Book.isbn
    
    var isbn: String
    var name: String
    
    
    init(isbn: String, name: String) {
        self.isbn = isbn
        self.name = name
    }
}


struct Spaceship: Identifiable {
    typealias Identifier = String
    static let idKeyPath: WritableKeyPath<Spaceship, Identifier> = \Spaceship.callsign
    
    
    var callsign: Identifier
    var capacity: Int
    
    
    init(callsign: Identifier, capacity: Int) {
        self.callsign = callsign
        self.capacity = capacity
    }
}



func printId<T: Identifiable>(of something: T) {
    print("\(something[keyPath: T.idKeyPath])")
}


let normandy = Spaceship(callsign: "SSV-2411", capacity: 50)
let book = Book(isbn: "q23pr8h", name: "The Silmarillion")


printId(of: normandy)
printId(of: book)

//: [Next](@next)
