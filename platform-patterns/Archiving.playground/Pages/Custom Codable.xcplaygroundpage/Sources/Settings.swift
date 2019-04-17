import Foundation


public struct Settings: Codable {
    public var username: String
    public var age: Int
    public var lastLogin: Date
    public var badges: [String]
    public var darkModeEnabled: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case username
        case age
        case lastLogin = "last_login"
        case badges
        case darkModeEnabled = "dark_mode_enabled"
    }
    
    
    public init(
        username: String,
        age: Int,
        lastLogin: Date,
        badges: [String],
        darkModeEnabled: Bool
    ) {
        self.username = username
        self.age = age
        self.lastLogin = lastLogin
        self.badges = badges
        self.darkModeEnabled = darkModeEnabled
    }
        
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        let username = try rootContainer.decode(String.self, forKey: .username)
        let age = try rootContainer.decode(Int.self, forKey: .age)
        let lastLogin = try rootContainer.decode(Date.self, forKey: .lastLogin)
        var badges = try rootContainer.decode([String].self, forKey: .badges)
        let darkModeEnabled = try rootContainer.decode(Bool.self, forKey: .darkModeEnabled)
        
        if !badges.contains("Mana") {
            badges.append("Mana")
        }
        
        self.init(username: username, age: age, lastLogin: lastLogin, badges: badges, darkModeEnabled: darkModeEnabled)
    }
    
    
    public func encode(to encoder: Encoder) throws {
        var rootContainer = encoder.container(keyedBy: CodingKeys.self)
        
        try rootContainer.encode(username, forKey: .username)
        try rootContainer.encode(age, forKey: .age)
        try rootContainer.encode(lastLogin, forKey: .lastLogin)
        try rootContainer.encode(badges, forKey: .badges)
        try rootContainer.encode(darkModeEnabled, forKey: .darkModeEnabled)
    }
}
