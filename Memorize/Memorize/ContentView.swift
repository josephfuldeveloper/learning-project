//
//  ContentView.swift
//  Memorize
//
//  Created by Jose Fuentes on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Card(isFaceUp: false)
            Card()
            Card()
            Card()
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct Card: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text("💩").font(.largeTitle)
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
