//
//  Dad_Joke_Widget.swift
//  Dad Joke Widget
//
//  Created by Carmen Lucas on 15/7/23.
//

import WidgetKit
import SwiftUI
import Intents


struct Dad_Joke_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, Color(.darkGray)], startPoint: .top, endPoint: .bottom)
            HStack (alignment: .center){
                Image("StewartLynch")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                Divider()
                VStack(alignment: .leading) {
                    Text(entry.joke.type.dropLast(2))
                        .font((.headline.smallCaps()))
                    Text(entry.joke.joke)
                        .font(.title)
                        .minimumScaleFactor(0.5)
                    Spacer()
                }
                
            }.foregroundColor(.white)
                .padding()
        }
    }
}

struct Dad_Joke_Widget: Widget {
    let kind: String = "Dad_Joke_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Dad_Joke_WidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Dad Jokes Widget")
        .description("Put a smile on your face.")
    }
}

struct Dad_Joke_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Dad_Joke_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), joke: Joke.placeholder))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
