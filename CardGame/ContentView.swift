//
//  ContentView.swift
//  CardGame
//
//  Created by Baris Ciftci on 28/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.green.ignoresSafeArea()
            
            VStack {
                Image("logo")
                
                HStack{
                    
                    Image("card2")
                    
                    Image("card2")
                }
                
                Button {
                    
                } label: {
                    Image("button")
                }
                
                HStack {
                    VStack{
                        Text("Player")
                        Text("0")
                    }
                    
                    VStack{
                        Text("Player")
                        Text("0")
                    }
                }

                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
