//
//  MessagesViewModel.swift
//  FilterListView
//
//  Created by Enric Herce on 13/03/2021.
//

import Foundation

class MessagesViewModel:ObservableObject{
    @Published var messagesArray:[MessagesModel] = [MessagesModel]()
    
    init(){
        
        messagesArray.append(MessagesModel(title: "first Message", content: "1"))
        messagesArray.append(MessagesModel(title: "second Message", content: "2"))
        messagesArray.append(MessagesModel(title: "third Message", content: "3"))
    }
    
    func order() -> [MessagesModel]{
        messagesArray = messagesArray.sorted(by:{$0.content > $1.content})
        print(messagesArray)
        return messagesArray
    }
}
