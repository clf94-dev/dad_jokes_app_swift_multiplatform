//
//  Dad_Jokes_WatchkitApp.swift
//  Dad Jokes Watchkit Watch App
//
//  Created by Carmen Lucas on 16/7/23.
//

import SwiftUI

@main
struct Dad_Jokes_Watchkit_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    WatchkitJokeView()
                    TypeSelectionView()
                }
               
            }
        }
    }
}
