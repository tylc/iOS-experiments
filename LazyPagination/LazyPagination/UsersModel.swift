//
//  UsersModel.swift
//  LazyPagination
//
//  Created by Enric Herce on 13/5/22.
//

import Foundation

struct Users : Decodable{
    let page : Int
    let perPage : Int
    let total: Int
    let totalPages : Int
    let data : [User]
}

struct User : Decodable, Hashable{
    let id : Int
    let email : String
    let firstName : String
    let lastName : String
    let avatar : URL
}

