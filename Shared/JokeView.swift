//
//  ContentView.swift
//  Dad jokes
//
//  Created by Carmen Lucas on 15/7/23.
//

import SwiftUI

struct JokeView: View {
    @State private var jokeString = "No Joke Available"
    @State private var fetching = false
    
    @AppStorage("jokeType") var jokeType: JokeType = .dadjoke
    var imageWidth: CGFloat{
        #if os(macOS)
        return 60
        #else
        return 120
        #endif
    }
    var font: Font{
        #if os(macOS)
        return .body
        #else
        return .title
        #endif
    }
    var frameWidth: CGFloat{
        #if os(macOS)
        return 205
        #else
        return min(UIScreen.main.bounds.size.width - 20, 600)
        #endif
    }
    var body: some View {
        VStack {
            HStack (alignment: .center){
                Image("StewartLynch")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth)
                VStack{
                    ForEach(JokeType.allCases, id :\.self) {item in
                        Button {
                            jokeType = item
                            Task{
                                await getJoke(jokeType.type)
                            }
                        } label: {
                            Text(item.rawValue)
                                .foregroundColor(item == jokeType ? .red : Color.primary)
                                                  
                        }
                        .buttonStyle(.bordered)
                    }
                }
                
            }
            if fetching {
                ProgressView()
            }
            else {
                VStack {
                    Text(jokeString)
                        .font(font)
                        .minimumScaleFactor(0.5)
                    HStack{
                        Spacer()
                        Button {
                            #if os(macOS)
                            let pasteboard = NSPasteboard.general
                            pasteboard.clearContents()
                            pasteboard.setString(jokeString, forType: NSPasteboard.PasteboardType.string)
                            #else
                            
                            let pasteboard = UIPasteboard.general
                            pasteboard.string = jokeString
                            #endif
                        } label: {
                            Text("Copy")
                        }.buttonStyle(.bordered)

                    }

                }
                .frame(width: frameWidth)
            }
            Spacer()
        }
        .padding()
        .task {
            await getJoke(jokeType.type)
        }
    }
    
    func getJoke(_ type: String) async {
        let url = "https://jokes.guyliangilsing.me/retrieveJokes.php?type=\(type)"
        let apiService = APIService(urlString: url)
        fetching.toggle()
        defer {
            fetching.toggle()
        }
        do {
            let joke: Joke = try await apiService.getJSON()
            jokeString = joke.joke
        } catch {
            jokeString = error.localizedDescription
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        #if os(iOS)
        JokeView()
        #else
        JokeView()
            .frame(width: 225, height: 255)
        #endif
    }
}
