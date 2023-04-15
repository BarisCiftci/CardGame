CardGame app is a game that users can play against the CPU.

When the user clicks the "Deal" button, the app pulls card image data randomly from the assets, and if the Player card is bigger than the CPU card, the system adds +1 point to the Player Score, otherwise +1 to the CPU Score. For more what "Deal" button can do please check below function of the button


func dealButtonAction() {
        
        //Vibrate the phone
        let haptic = UIImpactFeedbackGenerator(style: .light)

        haptic.impactOccurred()
        
        // Rotation Angle
        cpuRotationAngle = Int.random(in: -30...30)
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
            playerScore += 1
        } else if playerCardValue < cpuCardValue {
            
        // Add +1 to CPU
            cpuScore += 1
        } else {
            
        }
    }
![image](https://user-images.githubusercontent.com/65560636/232248026-1f6c0df9-15d3-4969-855b-5f936de5d3b8.png)
![image](https://user-images.githubusercontent.com/65560636/232248748-6ab2aebf-ad0c-4a65-82fd-da1282b97d79.png)
