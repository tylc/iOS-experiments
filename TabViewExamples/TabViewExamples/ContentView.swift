//
//  ContentView.swift
//  TabViewExamples
//
//  Created by Enric Herce on 08/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab:Int = 1
    
    var body: some View {
        
        /** About changing tabs programatically:
         First we need to create a state var to control in which tab we are.  This variable is used by TabView through the selection attribute.
         
         We also need to update this variable after we push the button. It's not necessary in the tabitem because is automatically updated by the selection attribute.
         
         As an extra, we need to use tag attribute. This is because selection attribute (that indicates in which view we are) is the TAG value, so we use .tag modifier.
         
         */
        TabView(selection: $currentTab){
            //First View
            ZStack{
                Color.purple
                    .ignoresSafeArea()
                
                VStack{
                    Text("First View")
                    Button ("Move to second view"){
                        currentTab=2
                    }
                    
                }
            }
            .tabItem {
                Label("First", systemImage: "1.square")
            }
            .tag(1)
            
            //Second View
            VStack{
                Text("Second View")
                Button("Move to third view"){
                    currentTab=3
                }
            }
            .tabItem {
                Label("Second", systemImage: "2.square")
            }
            .tag(2)
            
            //Third view
            VStack{
                Text("Third View")
                Button("Move to first view"){
                    currentTab=1
                }
            }
            .tabItem {
                Label("Third", systemImage: "3.square")
            }
            .tag(3)
        }//.tabViewStyle(PageTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
