import Foundation


public struct User {
    var name: String
    var street: String
    var city: String
    var state: String
    
//    init(
//        name: String,
//        street: String,
//        city: String,
//        state: String
//    ) {
//        self.name = name
//        self.street = street
//        self.city = city
//        self.state = state
//    }
//
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try rootContainer.decode(String.self, forKey: .name)
        
        let addressContainer = try rootContainer.nestedContainer(keyedBy: CodingKeys.AddressKeys.self, forKey: .address)
        
        street = try addressContainer.decode(String.self, forKey: .street)
        city = try addressContainer.decode(String.self, forKey: .city)
        state = try addressContainer.decode(String.self, forKey: .state)
    }
}



extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case address
        
        enum AddressKeys: String, CodingKey {
            case street
            case city
            case state
        }
    }
}



extension User: Encodable {
    public func encode(to encoder: Encoder) throws {
        var rootContainer = encoder.container(keyedBy: CodingKeys.self)
        
        try rootContainer.encode(name, forKey: .name)
        
        var addressContainer = rootContainer.nestedContainer(keyedBy: CodingKeys.AddressKeys.self, forKey: .address)
        
        try addressContainer.encode(street, forKey: .street)
        try addressContainer.encode(city, forKey: .city)
        try addressContainer.encode(state, forKey: .state)
    }
}
