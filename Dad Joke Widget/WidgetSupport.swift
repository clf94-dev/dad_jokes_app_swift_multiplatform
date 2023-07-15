//
//  WidgetSupport.swift
//  Dad Jokes iOS
//
//  Created by Carmen Lucas on 15/7/23.
//

import Foundation
import WidgetKit


struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), joke: Joke.placeholder)
    }
        
    func selectedType(for configuration: ConfigurationIntent) -> String {
        guard let jokeType = configuration.selectedChoice?.identifier else {
            return "dadjoke"
        }
        return jokeType
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let type = selectedType(for: configuration)
        let url = "https://jokes.guyliangilsing.me/retrieveJokes.php?type=\(type)"
        
        let apiService =  APIService(urlString: url)
        Task {
            do {
                let joke: Joke = try await apiService.getJSON()
                let entry = SimpleEntry(date: .now, configuration: configuration, joke: joke)
                completion(entry)
            } catch {
                let entry = SimpleEntry(date: .now, configuration: configuration, joke: Joke.placeholder)
                completion(entry)
            }
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let type = selectedType(for: configuration)
        let url = "https://jokes.guyliangilsing.me/retrieveJokes.php?type=\(type)"
        let apiService =  APIService(urlString: url)
        let currentDate = Date()
        let entryDate = Calendar.current.date(bySetting: .minute, value: 30, of: currentDate)!
        
        Task {
            do {
                let joke: Joke = try await apiService.getJSON()
                let entry = SimpleEntry(date: .now, configuration: configuration, joke: joke)
                let timeline = Timeline(entries: [entry], policy: .after(entryDate))
                completion(timeline)
            } catch {
                let entry = SimpleEntry(date: Date(), configuration: configuration, joke: Joke.placeholder)
                let timeline = Timeline(entries: [entry], policy: .after(entryDate))
                completion(timeline)
            }
        }
        
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let joke: Joke
}
