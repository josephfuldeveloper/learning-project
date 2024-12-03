//
//  ContentView.swift
//  Memorize
//
//  Created by Jose Fuentes on 28/11/24


import SwiftUI

struct ContentView: View {
    
    
    /// THE ELEMENTS
    
    let emojis = ["🤡","💩","🤮","🍕","🤮","♡","💩","🤮","🍕","🤮"]
    
    /// THE CARDS
    var TheCards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                Card(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundColor(.orange)
        }
    }
    
    
    /// FUNCTION FOR THE BUTTONS
    func Buttons(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    /// BUTTON REMOVER
    var Remover: some View {
        Buttons(by: -1, symbol: "minus.circle.fill")
            .foregroundColor(.red)
            .font(.system(size: 40))
    }

    /// BUTTON ADD
    var AddButton: some View {
        Buttons (by: +1, symbol: "plus.circle.dashed")
            .foregroundColor(.green)
            .font(.system(size: 40))
    }
    
    var cardAdjuster: some View {
        HStack {
            Remover
            Spacer()
            AddButton
        }
    }
    
    /// THE BODY OF THE APP
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                TheCards
            }
            Spacer ()
            cardAdjuster
        }
        .padding()
    }
}

struct Card: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 50)
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
