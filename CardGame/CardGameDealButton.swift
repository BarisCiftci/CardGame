//
//  CardGameDealButton.swift
//  CardGame
//
//  Created by Baris Ciftci on 01/04/2023.
//

import SwiftUI

struct CardGameDealButton: View {
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.red, lineWidth: CGFloat(12))
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
            HStack {
                Text(buttonText)
                    .font(.custom("Optima", size: 28))
                    .fontWeight(.black)
                    .foregroundColor(.red)
            }
        }
        .frame(height: 60)
        .padding(.horizontal, 80)
    }
}

struct CardGameDealButton_Previews: PreviewProvider {
    static var previews: some View {
        CardGameDealButton()
            .previewLayout(.sizeThatFits)
    }
}
