//
//  ContentView.swift
//  DiceGame
//
//  Created by David Svensson on 2022-02-23.
//

import SwiftUI

struct ContentView: View {
    
    @State var diceNumber1 = 2
    @State var diceNumber2 = 3
    
    @State var sum = 0
    
    var body: some View {
        ZStack {
            Color(red: 34/256, green: 123/256, blue: 55/256)
                .ignoresSafeArea()
            
            VStack {
                Text("\(sum)")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                HStack {
                    DiceView(n: diceNumber1)
                    DiceView(n: diceNumber2)
                }
               
                Button(action: {
                    roll()
                }, label: {
                    Text("Roll")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                })
                    .background(.red)
                    .cornerRadius(15.0)
                    
            }
        }
    }
    
    func roll() {
        diceNumber1 = Int.random(in: 1...6)
        diceNumber2 = Int.random(in: 1...6)
        
        sum += diceNumber1 + diceNumber2
    }
    
}


struct DiceView: View {
    let n : Int
    
//    init(n: Int) {
//        self.n = n
//    }
    
    var body: some View {
        Image(systemName: "die.face.\(n)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
