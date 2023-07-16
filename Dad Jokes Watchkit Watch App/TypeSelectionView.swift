//
//  TypeSelectionView.swift
//  Dad Jokes Watchkit Watch App
//
//  Created by Carmen Lucas on 16/7/23.
//

import SwiftUI

struct TypeSelectionView: View {
    @AppStorage("jokeType") var jokeType: JokeType = .dadjoke
    var body: some View {
        List {
            ForEach(JokeType.allCases, id: \.self) { item in
                Button {
                    jokeType = item
                } label: {
                    Text(item.rawValue)
                        .padding()
                        .listItemTint(item == jokeType ? .red : Color.init(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.3))
                }

            }
        }
        .padding(.horizontal)
        .navigationTitle("Joke Types")
        
    }
}

struct TypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TypeSelectionView()
    }
}
