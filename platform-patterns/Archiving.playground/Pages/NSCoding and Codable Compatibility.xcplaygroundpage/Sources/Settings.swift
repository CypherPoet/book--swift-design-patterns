import UIKit


public struct Settings: Codable {
    public var username: String
    public var age: Int
    public var lastLogin: Date
    public var badges: [String]
    public var darkModeEnabled: Bool
    public var favoriteColor: UIColor
    
    
    enum CodingKeys: String, CodingKey {
        case username
        case age
        case lastLogin = "last_login"
        case badges
        case darkModeEnabled = "dark_mode_enabled"
        case favoriteColor = "favorite_color"
    }
    
    
    public init(
        username: String,
        age: Int,
        lastLogin: Date,
        badges: [String],
        darkModeEnabled: Bool,
        favoriteColor: UIColor
    ) {
        self.username = username
        self.age = age
        self.lastLogin = lastLogin
        self.badges = badges
        self.darkModeEnabled = darkModeEnabled
        self.favoriteColor = favoriteColor
    }
        
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        let username = try rootContainer.decode(String.self, forKey: .username)
        let age = try rootContainer.decode(Int.self, forKey: .age)
        let lastLogin = try rootContainer.decode(Date.self, forKey: .lastLogin)
        var badges = try rootContainer.decode([String].self, forKey: .badges)
        
        if !badges.contains("Mana") {
            badges.append("Mana")
        }

        let darkModeEnabled = try rootContainer.decode(Bool.self, forKey: .darkModeEnabled)
        
        let favoriteColorData = try rootContainer.decode(Data.self, forKey: .favoriteColor)
        let favoriteColor = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(favoriteColorData) as? UIColor ?? UIColor.black
        
        self.init(username: username, age: age, lastLogin: lastLogin, badges: badges, darkModeEnabled: darkModeEnabled, favoriteColor: favoriteColor)
    }
    
    
    public func encode(to encoder: Encoder) throws {
        var rootContainer = encoder.container(keyedBy: CodingKeys.self)
        
        try rootContainer.encode(username, forKey: .username)
        try rootContainer.encode(age, forKey: .age)
        try rootContainer.encode(lastLogin, forKey: .lastLogin)
        try rootContainer.encode(badges, forKey: .badges)
        try rootContainer.encode(darkModeEnabled, forKey: .darkModeEnabled)
        
        let colorData = try NSKeyedArchiver.archivedData(withRootObject: favoriteColor, requiringSecureCoding: false)
        
        try rootContainer.encode(colorData, forKey: .favoriteColor)
    }
}
