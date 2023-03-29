//
//  ContentView.swift
//  CardGame
//
//  Created by Baris Ciftci on 28/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var lightGreenBackground: Color = Color(
        red: 139/255,
        green: 195/255,
        blue: 74/255)
    
    @State var darkGreenBackground: Color = Color(
        red: 56/255,
        green: 142/255,
        blue: 60/255)
    
    
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
                
                HStack{
                    Spacer()
                    Image("back")
                    Spacer()
                    Image("back")
                    Spacer()
                } // HSTACK : END
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("button")
                }
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text("Player")
                        Text("0")
                            .font(.title)
                    } // VSTACK : END
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text("CPU")
                        Text("0")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
