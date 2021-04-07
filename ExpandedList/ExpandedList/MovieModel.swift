//
//  MovieModel.swift
//  ExpandedList
//
//  Created by Enric Herce on 07/04/2021.
//

import Foundation

struct MovieModel:Identifiable{
    var id:Int
    var title:String
    var year:Int
    var synopsis:String
    var movies:[MovieModel]?
}
