//
//  ContentView.swift
//  CardGame
//
//  Created by Baris Ciftci on 28/03/2023.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @AppStorage("playerScore") var playerScore: Int = 0
    @AppStorage("cpuScore") var cpuScore: Int = 0
    
    @State var cpuRotationAngle = 0
    @State var PlayerRotationAngle = 0

    @State var displayWinAlert = false
    
    @State var winnerName: String = ""
   
    
    
    var body: some View {
        // this stack contains all UI elements in the view
        ZStack {
            //Background gradient
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
                        .rotationEffect(Angle(degrees: Double(cpuRotationAngle)))
                        .transition(AnyTransition.slide)
                }
                .scaledToFit()
                .padding(30)
                .shadow(color: .black, radius: 4, x: 1, y: 1)
                
                Spacer()
                
                Button {
                    dealButtonAction()
                    wonAlert()
                } label: {
                    CardGameDealButton()
                        
                }
                
                .alert(isPresented: $displayWinAlert, content: {

                    winnerAlert()
                })
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text(playerNameUser)
                        Text("\(playerScore)")
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text(playerNameCpu)
                        Text("\(cpuScore)")
                            .font(.title)
                    }
                    
                    
                    Spacer()
                    
                }
                .foregroundColor(.white)
                .fontWeight(.bold)
                
                Spacer()
                
            }
        }
    }
    
    
    func wonAlert() {
        
        let winnerHapticResponse = UINotificationFeedbackGenerator()
        
        if cpuScore >= 5 {
            displayWinAlert = true
            winnerHapticResponse.notificationOccurred(.warning)
            winnerName = playerNameCpu
        } else if playerScore >= 5 {
            displayWinAlert = true
            winnerHapticResponse.notificationOccurred(.success)
            winnerName = playerNameUser
            player.play()
        }
        
    }
    
    func getCardFor(cardValue: Int) -> String {
        return "card" + String(cardValue)
    }
    
    
    func dealButtonAction() {
        
        //Vibrate the phone
        let haptic = UIImpactFeedbackGenerator(style: .light)

        haptic.impactOccurred()
        
        // Rotation Angle
        cpuRotationAngle = Int.random(in: -30...30)
        PlayerRotationAngle = Int.random(in: -30...30)
        
        // Randomize the cpu's card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = getCardFor(cardValue: cpuCardValue)
        
        // Randomize the player's card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = getCardFor(cardValue: playerCardValue)
    
        // Update the scores
        if cpuCardValue > playerCardValue {
            cpuScore += 1
        } else if playerCardValue > cpuCardValue {
            playerScore += 1
        }

    }
    
    func winnerAlert() -> Alert {
        return Alert(
            title: Text("THE WINNER IS!"),
            message: Text(winnerName),
            primaryButton: .default(Text("Close App"), action: {
                
            }),
            secondaryButton: .destructive(Text("Reset Score"), action: {
                playerScore = 0
                cpuScore = 0
                
                cpuCard = "back"
                playerCard = "back"
                
                cpuRotationAngle = 0
                PlayerRotationAngle = 0
            }))
    }
     
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
