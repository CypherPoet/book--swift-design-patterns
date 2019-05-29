import Foundation

public struct City {
    public var name: String
    public var places: [String]
    
    
    public init(name: String, places: [String]) {
        self.name = name
        self.places = places
    }
}
