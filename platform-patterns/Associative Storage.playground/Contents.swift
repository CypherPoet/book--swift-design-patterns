import UIKit

/**
    “Although Swift’s extensions let you add methods and computed properties to existing data types,
    they don’t let you add stored properties. This stops you from arbitrarily changing the layout
    of existing data types, but can also lead to situations where you need to create a
    subclass in order to add new storage.
 
    Associative storage, where available, can serve as an excellent middle ground: you can
    read and write custom data in the storage as if it were stored properties,
    without needing to modify the structure of the data type itself”
 
        - Excerpt From: Paul Hudson. “Swift Design Patterns.”
 
    Furthermore, rather than digging around in `userInfo` we can create an extension to a type,
    that provides a computed property with getters and setters that work on `userInfo`'s behalf.
 */
 

struct User {
    var name: String
    var age: Int
    var userInfo: [String: Any]
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.userInfo = [:]
    }
}


extension User {
    private var favoriteRocketKey: String {
        return "🚀🚀FavoriteRocket🚀🚀"
    }
    
    var favoriteRocket: String? {
        get {
            return userInfo[favoriteRocketKey] as? String
        }
        set {
            userInfo[favoriteRocketKey] = newValue
        }
    }
}


var user = User(name: "Cypherpoet", age: 1000)

print(user.favoriteRocket)

user.favoriteRocket = "Falcon Heavy"

print(user.favoriteRocket ?? "None")
