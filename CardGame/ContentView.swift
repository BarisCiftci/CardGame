//
//  ContentView.swift
//  CardGame
//
//  Created by Baris Ciftci on 28/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    // Background gradient colors
    var lightGreenBackground: Color = Color(
        red: 139/255,
        green: 195/255,
        blue: 74/255)
    
    var darkGreenBackground: Color = Color(
        red: 56/255,
        green: 142/255,
        blue: 60/255)
    
    @ State var playerCard = "card5"
    @ State var cpuCard = "card6"
    
    @ State var playScore = 0
    @ State var CPUScore = 0
    
    
    var body: some View {
        
        // this stack contains all UI elements in the view
        ZStack {
            
            RadialGradient(
                colors: [lightGreenBackground, darkGreenBackground],
                center: .top,
                startRadius: 20,
                endRadius: 400).ignoresSafeArea()
            
                
            
            VStack {
                
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack(spacing: 16){
                    Image(playerCard)
                        .resizable()
                    Image(cpuCard)
                        .resizable()
                } // HSTACK : END
                .scaledToFit()
                .padding()
                
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text("Player")
                        Text(String(playScore))
                            .font(.title)
                    } // VSTACK : END
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text("CPU")
                        Text(String(CPUScore))
                            .font(.title)
                    } // VSTACK : END
                    
                    Spacer()
                    
                } // HSTACK : END
                .foregroundColor(.white)
                .fontWeight(.bold)
                
                Spacer()
                
            } // VSTACK : END
        } // ZSTACK : END
    }
    
    func deal() {
        // Randomize the player's card
        let playerCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(playerCardValue)
        
        // Randomize the CPU's card
        let cpuCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(cpuCardValue)
        
        // Update the scores
        if playerCardValue > cpuCardValue {
            
            // Add +1 to player
            playScore += 1
        } else if playerCardValue < cpuCardValue {
            
            // Add +1 to CPU
            CPUScore += 1
        } else {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
