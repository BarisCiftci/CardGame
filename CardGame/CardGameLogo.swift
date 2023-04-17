//
//  GardGameLogo.swift
//  CardGame
//
//  Created by Baris Ciftci on 01/04/2023.
//

import SwiftUI

struct CardGameLogo: View {
    
    private let strokeLine = 8
    
    private let logoFirstName = "CARD"
    private let logoSecondName = "GAME"
    
    var body: some View {
        ZStack {
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black, lineWidth: CGFloat(strokeLine))
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                HStack {
                    Text(logoFirstName)
                        .font(.custom("Optima", size: 28))
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Text(logoSecondName)
                        .font(.custom("Optima", size: 28))
                        .fontWeight(.black)
                }
                .foregroundColor(.red)
                .padding(.horizontal)
            }
            .frame(height: 60)
            .padding()
            
            ZStack {
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: CGFloat(strokeLine))
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                }
                .rotationEffect(Angle(degrees: -45))
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: CGFloat(strokeLine))
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                }
                .rotationEffect(Angle(degrees: 45))
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: CGFloat(strokeLine))
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                    Image("logoIcon")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                .rotationEffect(Angle(degrees: 0))
            }
                .frame(width: 80, height: 110)
        }
    }
}

struct GardGameLogo_Previews: PreviewProvider {
    static var previews: some View {
        CardGameLogo()
            .previewLayout(.sizeThatFits)
    }
}
