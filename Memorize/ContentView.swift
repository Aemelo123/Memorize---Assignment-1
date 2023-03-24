//
//  ContentView.swift
//  Memorize
//
//  Created by user931915 on 3/24/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚃", "🚅", "⛴"]
    
    @State var flags = ["🇺🇳", "🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇧🇼", "🇨🇲", "🇨🇦"]
    
    @State var animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐒", "🐔", "🐧", "🐦", "🐤", "🦆", "🦉", "🐛", "🐙"]
    
    @State var vehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚃", "🚅", "⛴"]
    
    @State var emojiCount = 8
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Vehicles
                Spacer()
                Flags
                Spacer()
                Animals
                
            }
            .padding(.horizontal)
            .font(.largeTitle)
            
        }
        .padding(.horizontal)
    }
    var Vehicles: some View {
        Button {
            emojis = vehicles.shuffled()
            emojiCount = Int.random(in: 8...24)
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.caption)
                }
        }
    }
    var Flags: some View {
        Button {
            emojis = flags.shuffled()
            emojiCount = Int.random(in: 8...24)
        } label: {
            VStack {
                Image(systemName: "flag")
                Text("Flags").font(.caption)
            }
        }
    }
    var Animals: some View {
        Button {
            emojis = animals.shuffled()
            emojiCount = Int.random(in: 8...24)
        } label: {
            VStack {
                Image(systemName: "hare")
                Text("Animals").font(.caption)
            }
        }
    }}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}











































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
