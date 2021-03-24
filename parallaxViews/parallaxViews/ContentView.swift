//
//  ContentView.swift
//  parallaxViews
//
//  Created by Enric Herce on 24/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            GeometryReader{reader in
              Image("TP")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    
                    //Parallax effect: We just need to tell our header image view to continuously offset its position while we are scrolling up and down. and making frame updated
                    
                    .offset(y:-reader.frame(in:.global).minY)
                    
                    //this is where magic happens
                    .frame(width:UIScreen.main.bounds.width, height:reader.frame(in:.global).minY+300)


            }
            .frame(height:300)

            
            
            VStack(alignment:.leading, spacing:15){
                Text("Twin Peaks")
                    .font(.system(size: 35.0, weight:.bold))
                    .foregroundColor(.white)
                    
                
                HStack{
                    ForEach(1...5, id:\.self){_ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                Text("Best TV Show ever")
                    .font(.caption)
                    .foregroundColor(.white)
                    
                Text(plot)
                    .foregroundColor(.white)
                
            }
            .padding(.top,10)
            .padding(.leading,20)
            .background(Color.gray)
            .cornerRadius(30)
            .offset(y:-35)
        })
        .edgesIgnoringSafeArea(.top)

        .background(Color.gray)
            
            
        
    }
}

var plot = "The show began with the discovery of the body of a murdered teenage prom queen, Laura Palmer (played by Sheryl Lee), in the small town of Twin Peaks, Washington, near the Canadian border and revolved around the ensuing murder investigation led by Dale Cooper (Kyle MacLachlan), an idiosyncratic FBI special agent sent to help solve the case. The investigation and the clues he received in his bizarre dreams gradually led Cooper to the network of secrets and mysteries surrounding the town and its eccentric inhabitants. Starting out as a murder mystery, the show evolved into an examination of the sinister double lives of the innocent-looking townsfolk and the dark, paranormal mysteries of this seemingly quaint town."

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
