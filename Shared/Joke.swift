//
//  Joke.swift
//  Dad jokes
//
//  Created by Carmen Lucas on 15/7/23.
//

import Foundation

struct Joke: Codable {
    let status: Int
    let response: String
    let joke: String
    let type: String
    
    static var placeholder: Joke {
        Joke(status: 200, response: "success", joke: "What did the ocen say to the shore? Nothing, it just waved", type: "Dad joke: ")
    }
}
