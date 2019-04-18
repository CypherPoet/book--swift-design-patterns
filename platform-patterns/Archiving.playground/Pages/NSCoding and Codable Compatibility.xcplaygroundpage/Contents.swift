//: [Previous](@previous)

import UIKit


let dateEncodingStrategy = JSONEncoder.DateEncodingStrategy.iso8601
let dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.iso8601


func encode(settings: Settings) -> Data? {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = dateEncodingStrategy
    
    do {
        return try encoder.encode(settings)
    } catch {
        print("Error while attempting to encode settings to data:\n\n\(error.localizedDescription)")
    }
    
    return nil
}


func decodeSettings(from json: Data) -> Settings? {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = dateDecodingStrategy
    
    do {
        return try decoder.decode(Settings.self, from: json)
    } catch {
        print("Error while attempting to decode settings from JSON data:\n\n\(error.localizedDescription)")
    }
    
    return nil
}


let settings = Settings(
    username: "CypherPoet",
    age: 999,
    lastLogin: .distantFuture,
    badges: ["Earth", "Wind", "Fire"],
    darkModeEnabled: true,
    favoriteColor: .purple
)


if let data = encode(settings: settings) {
    // peek at JSON
    let json = String(decoding: data, as: UTF8.self)
    print("Encoded setting to JSON:\n\n\(json))")
    
    let newSettings = decodeSettings(from: data)
    
    print("New Settings:\n\n")
    print(newSettings!)
}




//: [Next](@next)
