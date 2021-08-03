//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Enric Herce on 14/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection:Int=1
    
    var body: some View {
        
        
        NavigationView{
            /*
             We want to have the capability to know the width and height of the ContentView depending on the particular device the app runs on. We need to know this to adjust the size of the tab bar dynamically. For this purpose, we wrap our VStack into a GeometryReader.The GeometryReader reads out its parent view’s size dimensions. In our case, that should be the ContentView as the overall super-view, the one that covers the entire screen.
             **/
            GeometryReader{geometry in
                VStack {
                    Text("here we go \(selection)")
                    
                    switch selection{
                    case 1:
                            DestinationExample(current: 1)
                    case 2:
                            DestinationExample(current: 2)
                    case 3:
                            DestinationExample(current: 3)
                    case 4:
                            DestinationExample(current: 4)
                    case 5:
                            DestinationExample(current: 5)
                    default:
                            DestinationExample(current: 1)
                    }
                    
                   
                    
                    Spacer()
                    //our custom tabBar goes here
                    HStack{
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home", order:1, selection:$selection)
                        
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "liked",order:2, selection:$selection)
                        
                        
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                            
                            
                            Button(action: {
                                selection=3
                                
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                    .foregroundColor(Color("tabBigButton"))
                            })
                            
                                    
                                    
                                    
                           
                                  
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        .offset(y: -geometry.size.height/8/2)
                        
                        
                        
                        
                        
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "waveform", tabName: "Records",order:4, selection:$selection)
                        
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Account",order:5, selection:$selection)
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("TabBarBackground").shadow(radius: 2))
                    
                }.edgesIgnoringSafeArea(.bottom)
            }
        }
        }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBarIcon: View {
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    let order:Int
    @Binding var selection:Int
    var body: some View {
        
        VStack{
            Button(action: {
                selection=order
            },
                   label: {
                    VStack{
                        Image(systemName: systemIconName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width, height: height)
                            .padding(.top, 10)
                        Text(tabName)
                            .font(.footnote)
                        Spacer()
                    }
                    
                   })
            
            
        }
    }
}
