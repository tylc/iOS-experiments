//
//  ContentView.swift
//  ProgressView
//
//  Created by Enric Herce on 22/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var time:Double =  0.0
    @State var show:Bool = true
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        NavigationView{
            VStack{
                
                if(show){
                    ProgressView("Uploading...", value: time, total: 100.0)
                        .padding(.all)
                        .onReceive(timer){ _ in
                            if time < 100 {
                                time += 2
                            }
                        }
                    
                    ProgressView("Uploading...", value: time, total: 100.0)
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding(.all)
                        .onReceive(timer){ _ in
                            if time >= 100{
                                show = false
                            }
                        }
                }else{
                    Text("Progress completed!")
                        .font(.headline)
                        .padding(10)
                        .foregroundColor(.black)
                        

                            
                        
                        .shadow(color: Color.blue, radius: 20, y: 5)
                        
                    
                        
                }
                
                    
                    
                   
                
            }.navigationTitle("Progress View Styles")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
