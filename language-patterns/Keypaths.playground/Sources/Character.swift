import Foundation

public struct Character {
    public var name: String
    public var city: City
    
    
    public init(name: String, city: City) {
        self.name = name
        self.city = city
    }
}
