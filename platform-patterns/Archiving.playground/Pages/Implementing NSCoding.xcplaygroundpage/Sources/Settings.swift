import Foundation

public class Settings: NSObject, NSCoding, NSSecureCoding {
    public static var supportsSecureCoding = true
    
    public var username: String
    public var age: Int
    public var lastLogin: Date
    public var badges: [String]
    public var darkModeEnabled: Bool
    
    
    /**
     🔑 Even though we aren't using Codable, we can still mimic the "CodingKeys" enum pattern
     to keep our keys organized -- and minimize future changes if we DO decide to upgrade this
     class to Codeable conformance in the future.
     */
    enum CodingKeys: String {
        case username
        case age
        case lastLogin
        case badges
        case darkModeEnabled
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
    
    
    public convenience required init?(coder aDecoder: NSCoder) {
        guard
            let username = aDecoder.decodeObject(forKey: CodingKeys.username.rawValue) as? String,
            let badges = aDecoder.decodeObject(forKey: CodingKeys.badges.rawValue) as? [String],
            let lastLogin = aDecoder.decodeObject(forKey: CodingKeys.lastLogin.rawValue) as? Date
        else {
                preconditionFailure("Unable to decode objects")
        }
        
        self.init(
            username: username,
            age: aDecoder.decodeInteger(forKey: CodingKeys.age.rawValue),
            lastLogin: lastLogin,
            badges: badges,
            darkModeEnabled: aDecoder.decodeBool(forKey: CodingKeys.darkModeEnabled.rawValue)
        )

    }
}


extension Settings {

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(username, forKey: CodingKeys.username.rawValue)
        aCoder.encode(age, forKey: CodingKeys.age.rawValue)
        aCoder.encode(lastLogin, forKey: CodingKeys.lastLogin.rawValue)
        aCoder.encode(badges, forKey: CodingKeys.badges.rawValue)
        aCoder.encode(darkModeEnabled, forKey: CodingKeys.darkModeEnabled.rawValue)
    }
    
}

