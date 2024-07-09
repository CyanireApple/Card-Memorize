//
//  ContentView.swift
//  Card Memorize
//
//  Created by Cyan on 2024/7/9.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["😀","☺️","🥳","🙁","😭","😜","😠"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
            }
            Button("Add Card") {
                    cardCount += 1
            }
            Button("Remove Card") {
                    cardCount -= 1
            }
        }
    }
        .foregroundColor(.blue)
        .padding()
    }
}

struct CardView: View {
    var content: String = "🫥"
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
