//
//  ContentView.swift
//  SortingArrays
//
//  Created by Enric Herce on 01/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var playerList:PlayerViewModel = PlayerViewModel()
    
   

    
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack{
                    List {
                        
                        ForEach(playerList.listOfPlayers){player in
                            Text(player.name)
                        }
                        
                    }
                    .navigationTitle("Barça Players")
                
                
                }
                VStack{
                    Spacer()
                    Button(action: { playerList.sortByName()
                        playerList.objectWillChange.send()
                    
                    })
                    {
                        Text("Sort players by name")
                            
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 2)
                                  
                                    .clipShape(Capsule()))
                    }
                    
                    .padding(20)
                    
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
