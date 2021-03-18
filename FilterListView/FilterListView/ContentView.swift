//
//  ContentView.swift
//  FilterListView
//
//  Created by Enric Herce on 13/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var messagesList = MessagesViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach (messagesList.messagesArray){ message in
                        Text(message.title)
                    }
                }
            }
            .navigationBarTitle(Text("Filter List"))
            /*.toolbar {
                Button("Help") {
                    print("Help tapped!")
                }
            }*/
            .toolbar{
                ToolbarItem {
                    Button(action: {
                        messagesList.messagesArray = messagesList.order()
                    }){
                        Text("Order")
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
