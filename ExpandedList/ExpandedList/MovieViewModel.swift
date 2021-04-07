//
//  MovieViewModel.swift
//  ExpandedList
//
//  Created by Enric Herce on 07/04/2021.
//

import Foundation

class MovieViewModel:ObservableObject{
    
    
    @Published var movieList:[MovieModel] = []
    
    init(){
        loadStaticData()
    }
   
    func loadStaticData(){
        movieList = [MovieModel(id: 0,title: "Matrix Saga",year: 1999,synopsis: "A saga about how machines underestimated humans",movies: [
            MovieModel(id: 1, title: "Matrix", year: 1999, synopsis: "Neo wakes up from Matrix and beats the system" ),
            MovieModel(id: 2, title: "Matrix Reloaded", year: 2003, synopsis: "Neo wants to destroy the system" ),
            MovieModel(id: 3, title: "Matrix Revolutions", year: 2003, synopsis: "Neo wins" )
            ]
        )]
        
    }
    
}
