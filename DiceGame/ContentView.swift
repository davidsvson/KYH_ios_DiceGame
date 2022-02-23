//
//  ContentView.swift
//  DiceGame
//
//  Created by David Svensson on 2022-02-23.
//

import SwiftUI

/**************
 Skapa ett tärningspel där man slår 2 tärningar. Efter Valfritt antal s
 slag kan en omgång avslutas och spara hittils uppnådda poäng.
 om Poängen för en omgång överskrider 21 blir istället poängen 0 fäör den omgången
 
 Målet för spelet är att uppnå 100p på så få omgångar som möjligt
 ***/

//V8
//Ons david dicegame  + stäm av med thomas
//Fre David
//
//
//V9
//Ons thomas
//Fre David
//
//
//V10
//Ons David + Thomas
//Fre David
//
//
//V11
//Ons David + Thomas
//Fre David
//


struct ContentView: View {
    
    @State var diceNumber1 = 2
    @State var diceNumber2 = 3
    
    @State var sum = 0
    @State var showingBustSheet = false
    
    var body: some View {
        ZStack {
            Color(red: 34/256, green: 123/256, blue: 55/256)
                .ignoresSafeArea()
            
            VStack {
                Text("\(sum)")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
                HStack {
                    DiceView(n: diceNumber1)
                    DiceView(n: diceNumber2)
                }
                .onAppear() {
                    newDiceValues()
                }
                
                Spacer()
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
                Spacer()
            }
        }
        .sheet(isPresented: $showingBustSheet, onDismiss: { sum = 0 }) {
            BustSheet()
        }

    }
    
    func roll() {
        newDiceValues()
        
        sum += diceNumber1 + diceNumber2
        if sum > 21 {
            showingBustSheet = true
        }
    }
    
    func newDiceValues() {
        diceNumber1 = Int.random(in: 1...6)
        diceNumber2 = Int.random(in: 1...6)
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


struct BustSheet : View {
    
    var body: some View {
        ZStack {
            Color(red: 34/256, green: 123/256, blue: 55/256)
                .ignoresSafeArea()
            
            VStack {
                Text("Bust")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                Text("34")
                    .foregroundColor(.red)
                    .font(.title)
                    .padding()
                
            }
        }
        
        
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //BustSheet()
        //DiceView(n: 3)
    }
}
