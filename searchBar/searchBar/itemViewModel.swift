//
//  itemViewModel.swift
//  searchBar
//
//  Created by Enric Herce on 15/04/2021.
//

import Foundation

class itemViewModel:ObservableObject{
    
    @Published var itemModelList:[itemModel]
    
    init(){
        itemModelList = [itemModel(name: "Buy PSN Credit", sfIcon: "wallet.pass.fill"),
        itemModel(name: "make an intuitive app", sfIcon: "applescript.fill"),
        itemModel(name: "sell the t-shirt", sfIcon: "cart.fill")]
    }
}
