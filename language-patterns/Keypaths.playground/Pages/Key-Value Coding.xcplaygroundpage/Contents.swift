//: [Previous](@previous)

import Foundation


let london = City(
    name: "London",
    places: [
        "Tower of London",
        "The British Museum",
        "The Barbican"
    ]
)

let detective = Character(name: "Sherlock Holmes", city: london)
let spy = Character(name: "James Bond", city: london)


/**
    With keypaths, we can create a reference to where a character’s city name
    is stored without actually reading it directly.
 
    We can then apply that reference to any number of other values to
    read their city names.
 */

let characterNamePath = \Character.name
let cityNamePath = \Character.city.name
let secondCityPlacePath = \Character.city.places[1]

print(detective[keyPath: characterNamePath])
print(detective[keyPath: cityNamePath])
print(detective[keyPath: secondCityPlacePath])

print(spy[keyPath: characterNamePath])
print(spy[keyPath: cityNamePath])
print(spy[keyPath: secondCityPlacePath])

//: [Next](@next)
