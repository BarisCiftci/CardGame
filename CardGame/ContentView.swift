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
        red: 12/255,
        green: 119/255,
        blue: 0/255)
    
    var darkGreenBackground: Color = Color(
        red: 8/255,
        green: 68/255,
        blue: 0/255)
    
    @State var playerCard = "card5"
    @State var cpuCard = "card6"
    
    @State var playScore = 0
    @State var CPUScore = 0
    
    @State var CPURotationAngle = 0
    @State var PlayerRotationAngle = 0
    
    var body: some View {
        
        // this stack contains all UI elements in the view
        ZStack {
            
            RadialGradient(
                colors: [lightGreenBackground, darkGreenBackground],
                center: .topLeading,
                startRadius: 120,
                endRadius: 670).ignoresSafeArea()
            
                
            
            VStack {
                
                Spacer()
                
                CardGameLogo()
                
                Spacer()
                
                HStack(spacing: 30){
                    Image(playerCard)
                        .resizable()
                        .rotationEffect(Angle(degrees: Double(PlayerRotationAngle)))
                    Image(cpuCard)
                        .resizable()
                        .rotationEffect(Angle(degrees: Double(CPURotationAngle)))
                        .transition(AnyTransition.slide)
                } // HSTACK : END
                .scaledToFit()
                .padding(30)
                .shadow(color: .black, radius: 4, x: 1, y: 1)
                
                Spacer()
                
                Button {
                    dealButtonAction()
                } label: {
                    CardGameDealButton()
                        
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
    
    func dealButtonAction() {
        // Rotation Angle
        CPURotationAngle = Int.random(in: -30...30)
        PlayerRotationAngle = Int.random(in: -30...30)
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
