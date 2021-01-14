//
//  MenuButton.swift
//  FloatingMenu
//
//  Created by Enric Herce on 13/01/2021.
//

import Foundation

struct menuButton: Identifiable{
    let id:Int
    let text:String
    private(set) var action: (() -> Void)? = nil
}

