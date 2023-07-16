//
//  ContentView.swift
//  Dad Jokes Watchkit Watch App
//
//  Created by Carmen Lucas on 16/7/23.
//

import SwiftUI

struct WatchkitJokeView: View {
    @State private var jokeString = "No Joke Available"
    @State private var fetching = false
    @State private var navigationTitle = ""
    @AppStorage("jokeType") var jokeType: JokeType = .dadjoke

    var body: some View {
        ZStack{
            if fetching {
                ProgressView()
            } else {
                VStack (alignment: .leading) {
                    Text(jokeString)
                        .minimumScaleFactor(0.5)
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            Task {
                                await getJoke()
                            }
                        } label: {
                            Image(systemName: "goforward")
                        }
                        .frame(width: 40)
                    }
                }
                .padding(.horizontal)
            }
            Image("StewartLynch")
                .resizable()
                .opacity(0.3)
        }
        .navigationTitle(navigationTitle)
        .task {
            await getJoke()
        }
       
    }
    
    func getJoke() async {
        let url = "https://jokes.guyliangilsing.me/retrieveJokes.php?type=\(jokeType)"
        let apiService = APIService(urlString: url)
        fetching.toggle()
        defer {
            fetching.toggle()
        }
        do {
            let joke: Joke = try await apiService.getJSON()
            jokeString = joke.joke
            navigationTitle = String(joke.type.dropLast(2))
        } catch {
            jokeString = error.localizedDescription
        }
    }
}



struct WatchkitJokeView_Previews: PreviewProvider {
    static var previews: some View {
        WatchkitJokeView()
    }
}
