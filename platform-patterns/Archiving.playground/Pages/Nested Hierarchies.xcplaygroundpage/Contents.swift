//: [Previous](@previous)

import Foundation

let userJSON = """
    {
        "name": "Taylor Swift",
        "address": {
            "street": "1989 Taylor Swift Avenue",
            "city": "New York",
            "state": "New York"
        }
    }
"""


func encode(_ user: User) -> Data? {
    let encoder = JSONEncoder()
    
    do {
        return try encoder.encode(user)
    } catch {
        print("Error while attempting to encode user:\n\n\(error.localizedDescription)")
    }
    
    return nil
}


func decodeUser(from data: Data) -> User? {
    do {
        let decoder = JSONDecoder()
    
        return try decoder.decode(User.self, from: data)
    } catch {
        print("Error while attempting to decode user:\n\n\(error.localizedDescription)")
    }
    
    return nil
}


let jsonData = Data(userJSON.utf8)

if let user = decodeUser(from: jsonData) {
    if let newJSONData = encode(user) {
        print("New JSON data:", terminator: "\n\n")
        print(String(decoding: newJSONData, as: UTF8.self))
    }
}

//: [Next](@next)
