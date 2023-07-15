//
//  JokeType.swift
//  Dad jokes
//
//  Created by Carmen Lucas on 15/7/23.
//

import Foundation

enum JokeType : String, Decodable, CaseIterable{
    case chucknorris = "Chuck Norris",
    dadjoke = "Dad Joke",
    random = "Random",
    yomama = "Yo Mama"
    
    var type: String {
        switch self {
        case .chucknorris:
            return "chucknorris"
        case .dadjoke:
            return "dadjoke"
        case .random:
            return "random"
        case .yomama:
            return "yomama"
        }
    }
}
