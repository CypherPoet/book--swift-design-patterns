import UIKit

let decodeDateFormatter = JSONDecoder.DateDecodingStrategy.iso8601
let encodeDateFormatter = JSONEncoder.DateEncodingStrategy.iso8601

let customDateFormatter = DateFormatter()
customDateFormatter.dateStyle = .full
customDateFormatter.timeStyle = .full


let crazyEncodeDate = { (date: Date, encoder: Encoder) -> Void in
    var container = encoder.singleValueContainer()
    
    try container.encode("📅 The date is \(date) 🦄")
}


func encode(settings: Settings) -> Data? {
    let encoder = JSONEncoder()
    
//    encoder.dateEncodingStrategy = encodeDateFormatter
//    encoder.dateEncodingStrategy = .formatted(customDateFormatter)
    encoder.dateEncodingStrategy = .custom(crazyEncodeDate)
    
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    
    do {
        return try encoder.encode(settings) as Data
    } catch {
        print("Error while encoding settings:\n\n\(error.localizedDescription)")
    }
    
    return nil
}


func decode(settingsData: Data) -> Settings? {
    let decoder = JSONDecoder()
    
//    decoder.dateDecodingStrategy = decodeDateFormatter
//    decoder.dateDecodingStrategy = .formatted(customDateFormatter)
    decoder.dateDecodingStrategy = .custom({ (decoder: Decoder) -> Date in
        let container = try decoder.singleValueContainer()
        print(try container.decode(String.self))
        
        return Date()
    })
    
    do {
        return try decoder.decode(Settings.self, from: settingsData)
    } catch {
        print("Error while decoding settings data:\n\n\(error.localizedDescription)")
    }
    
    return nil
}



let settings = Settings(
    username: "CypherPoet",
    age: 999,
    lastLogin: .distantFuture,
    badges: ["Earth", "Wind", "Fire"],
    darkModeEnabled: true
)


if let data = encode(settings: settings) {
    // peek at JSON
    let json = String(decoding: data, as: UTF8.self)
    print(json)
    

    let decodedSettings = decode(settingsData: data)

    print(decodedSettings?.username ?? "")
    print(decodedSettings?.lastLogin ?? "")
}

