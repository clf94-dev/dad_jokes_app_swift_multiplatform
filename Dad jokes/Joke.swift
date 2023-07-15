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
}
