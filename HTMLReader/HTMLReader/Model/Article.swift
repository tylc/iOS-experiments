//
//  Article.swift
//  HTMLReader
//
//  Created by Enric Herce on 12/5/22.
//

import Foundation

struct Article: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var url: URL?
    var publishDate: Date
}


