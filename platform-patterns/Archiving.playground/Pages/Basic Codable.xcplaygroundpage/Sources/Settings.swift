import Foundation


public struct Settings: Codable {
    public var username: String
    public var age: Int
    public var lastLogin: Date
    public var badges: [String]
    public var darkModeEnabled: Bool
    

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
}
