//
//  ContentView.swift
//  CardGame
//
//  Created by Baris Ciftci on 28/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // this stack contains all UI elements in the view
        ZStack {
            
            Color.green.ignoresSafeArea()
            
            VStack {
                
                Image("logo")
                
                HStack{
                    Image("card2")
                    
                    Image("card2")
                } // HSTACK : END
                
                Button {
                    
                } label: {
                    Image("button")
                }
                
                HStack {
                    VStack{
                        Text("Player")
                        Text("0")
                    } // VSTACK : END
                    
                    VStack{
                        Text("Player")
                        Text("0")
                    } // VSTACK : END
                } // HSTACK : END
                
                
            } // VSTACK : END
        } // ZSTACK : END
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
