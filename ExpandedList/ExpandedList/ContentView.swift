//
//  ContentView.swift
//  ExpandedList
//
//  Created by Enric Herce on 07/04/2021.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var moviesData:MovieViewModel = MovieViewModel()

        var body: some View {
            
             List(moviesData.movieList,children:\.movies){ row in
                VStack{
                    HStack{
                        Text(row.title)
                        Spacer()
                        Text(String(row.year))
                       
                        
                    }
                    if(row.id != 0){
                        Text(row.synopsis)
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
