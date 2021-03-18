//
//  MessagesModel.swift
//  FilterListView
//
//  Created by Enric Herce on 13/03/2021.
//

import Foundation

struct MessagesModel:Identifiable{
    var id:UUID = UUID()
    var title:String
    var content:String
}
