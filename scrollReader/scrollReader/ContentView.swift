//
//  ContentView.swift
//  scrollReader
//
//  Created by Enric Herce on 13/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    /*
     ScrollviewReader: its a container wich allows us to move to a certain element of a scrollview. Usage is simple, as you can see we add an .id to the element, we encapsulate our scrollview and work with the buttons we add.
     
        ScrollViewReader, as the geometryreader, has a proxy variable to work with. This allows us to use scrollTo method qich uss an index
     */
    
    
    let images = ["sf","cv","torr","roc"]
    @State private var currentIndex = 0
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                ScrollViewReader{scrollView in
                    ScrollView(.horizontal){
                        HStack{
                            ForEach (images.indices) { index in
                                
                                Image(images[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width - 50)
                                    .cornerRadius(25)
                                    .padding(.horizontal, 25)
                                    //this indexes every element in the scrollview
                                    .id(index)
                                
                            }
                        }
                    }
                    //here we go with the buttons
                    HStack{
                        //our nice buttons
                        Button(action:{
                            currentIndex = 0
                            scrollView.scrollTo(0)
                        }
                        ,label:{
                            Image(systemName: "backward.end.fill")
                                .font(.system(size: 25))
                        })
                        
                        
                        Button(action:{
                            
                            currentIndex = (currentIndex == 0) ? currentIndex : currentIndex-1
                            scrollView.scrollTo(currentIndex)
                        }
                        ,label:{
                            Image(systemName: "arrowtriangle.backward.circle")
                                .font(.system(size: 25))
                            
                        })
                        
                        
                        Button(action:{
                            //if (currentIndex+1 equals to image count) we do(?) currentIndex to 0 (0) else(:) current intex +1
                            currentIndex = (currentIndex == images.count-1) ? 0 : currentIndex + 1
                            
                            scrollView.scrollTo(currentIndex)
                        }
                        ,label:{
                            Image(systemName: "arrowtriangle.forward.circle")})
                        .font(.system(size: 25))
                        

                        
                        Button(action:{
                            currentIndex = images.count-1
                            scrollView.scrollTo(images.count-1)
                        }
                        ,label:{
                            Image(systemName: "forward.end.fill")
                                .font(.system(size: 25))
                        })
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
