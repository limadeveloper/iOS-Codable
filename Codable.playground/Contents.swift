//: Playground - noun: a place where people can play

import UIKit
import Foundation

let jsonData = """
{
    "id": 1,
    "name": "Yoda",
    "rank": "Grand Master",
    "age": 900,
    "light_saber": {
        "color": "green"
    }
}
""".data(using: .utf8)!

struct Jedi: Codable {
    
    let id: Int
    let name: String
    let rank: String
    let age: Int
    let lightSaber: LightSaber
    
    struct LightSaber: Codable {
        let color: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case rank
        case age
        case lightSaber = "light_saber"
    }
}

let decoder = JSONDecoder()
let jedi = try decoder.decode(Jedi.self, from: jsonData)

