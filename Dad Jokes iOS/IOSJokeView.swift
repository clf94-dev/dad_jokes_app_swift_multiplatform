//
//  ContentView.swift
//  Dad Jokes iOS
//
//  Created by Carmen Lucas on 15/7/23.
//

import SwiftUI

struct IOSJokeView: View {
    var body: some View {
        NavigationStack{
            JokeView()
                .navigationTitle("Dad Jokes")
        }
     
        
    }
}

struct IOSJokeView_Previews: PreviewProvider {
    static var previews: some View {
        IOSJokeView()
    }
}
