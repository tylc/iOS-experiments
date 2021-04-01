//
//  Player.swift
//  SortingArrays
//
//  Created by Enric Herce on 01/04/2021.
//

import Foundation

struct Player:Identifiable, Hashable{
    var id:UUID=UUID()
    var name:String
    var position:String
    var number:Int
}
