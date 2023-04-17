//
//  ContentView.swift
//  CardGame
//
//  Created by Baris Ciftci on 28/03/2023.
//

import SwiftUI
import AVFoundation

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
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    let playerNameUser = "Human"
    let playerNameCpu = "ChatGPT"
    let player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "mp3")!))
    
    @AppStorage("playerScore") var playerScore: Int = 0
    @AppStorage("cpuScore") var cpuScore: Int = 0
    
    @State var cpuRotationAngle = 0
    @State var PlayerRotationAngle = 0

    @State var displayWinAlert = false
    
    @State var winMessage: String = ""
   
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

                    Alert(
                        title: Text("THE WINNER IS!"),
                        message: Text(winMessage),
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
                })
                
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text(playerNameCpu)
                        Text("\(cpuScore)")
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text(playerNameUser)
                        Text("\(playerScore)")
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
            winMessage = playerNameCpu
        } else if playerScore >= 5 {
            displayWinAlert = true
            winnerHapticResponse.notificationOccurred(.success)
            winMessage = playerNameUser
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
        
        // Randomize the player's card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = getCardFor(cardValue: cpuCardValue)
        
        // Randomize the CPU's card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = getCardFor(cardValue: playerCardValue)
    
        // Update the scores
        if playerCardValue > cpuCardValue {
            
        // Add +1 to player
            playerScore += 1
        } else if playerCardValue < cpuCardValue {
            
        // Add +1 to CPU
            cpuScore += 1
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
