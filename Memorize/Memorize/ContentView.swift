//
//  ContentView.swift
//  Memorize
//
//  Created by Jose Fuentes on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🤡","💩","🤮","🍕","🤮"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                Card(content: emojis[index])
            }
           
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct Card: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
