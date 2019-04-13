//: [Previous](@previous)

import Foundation


let settings = Settings(
    username: "CypherPoet",
    age: 999,
    lastLogin: .distantFuture,
    badges: ["Earth", "Wind", "Fire"],
    darkModeEnabled: true
)


print(settings.badges)

do {
    let data = try NSKeyedArchiver.archivedData(withRootObject: settings, requiringSecureCoding: true)
    
    // take a peek
//    let payloadString = String(decoding: data, as: UTF8.self)
//    print(payloadString)
    
//    let unpackedSettings = try NSKeyedUnarchiver.unarchivedObject(ofClass: Settings.self, from: data)
    let unpackedSettings = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Settings

    print(unpackedSettings?.username ?? "")
    print(unpackedSettings?.badges ?? "")
    print(unpackedSettings?.lastLogin ?? "")
} catch {
    print("Error while transforming data:\n\n\(error.localizedDescription)")
}



//: [Next](@next)
