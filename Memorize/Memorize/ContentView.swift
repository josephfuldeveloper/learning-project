//
//  ContentView.swift
//  Memorize
//
//  Created by Jose Fuentes on 28/11/24


import SwiftUI

struct ContentView: View {
    
    
    /// THE ELEMENTS
    
    let emojis = ["🤡","💩","🤮","🍕","🤮","♡","💩","🤮","🍕","🤮","🍟","🍕"]
    
    
    /// THE CARDS
    var TheCards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(emojis.indices, id: \.self) { index in
                Card(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundColor(.orange)
        }
    }
    
    var Title: some View {
        Text ("Memorize Game")
            .font(.system(size: 30).bold())
            .padding()
    }
    
    /// THE BODY OF THE APP
    var body: some View {
        VStack {
            ScrollView {
                Title
                Spacer(minLength: 34)
                TheCards
            }
        }
        .padding()
    }
}


struct Card: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
