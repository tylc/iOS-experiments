//
//  ContentView.swift
//  FloatingMenu
//
//  Created by Enric Herce on 13/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                // Example
                Rectangle()
                    .foregroundColor(.blue)
                    .padding()
                    
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        MenuView(
                            mainButton: menuButton(id:1, text: "⋯"),
                            secondaryButtons: [
                                menuButton(id:2,text: "New"),
                                menuButton(id:3,text: "Fav")
                            ]
                        )
                        .padding()
                    }
                }
            }.navigationBarTitle("Floating Menu:")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
