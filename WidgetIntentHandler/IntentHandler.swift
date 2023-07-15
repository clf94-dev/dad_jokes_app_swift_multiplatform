//
//  IntentHandler.swift
//  WidgetIntentHandler
//
//  Created by Carmen Lucas on 15/7/23.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling {
    func provideSelectedChoiceOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<Choice>?, Error?) -> Void) {
        let choices = JokeType.allCases.map {jokeType in
            Choice(identifier: jokeType.type, display: jokeType.rawValue)
            
        }
        let collection = INObjectCollection<Choice>(items: choices)
        completion(collection, nil)
    }
    
    
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
