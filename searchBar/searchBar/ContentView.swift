//
//  ContentView.swift
//  searchBar
//
//  Created by Enric Herce on 15/04/2021.
//

import SwiftUI

struct ContentView: View {
   
    
    @ObservedObject var items:itemViewModel = itemViewModel()
    @State var searchText:String = ""
    
    var body: some View {
        VStack{

            searchBar(text: $searchText)
            
            /*
             We have to change List() by using filter function.
             This function just filter by the next premise: searchText is the text we insert so first we check if isEmpty (it's true adn returns all the list). If it's false we show the result with caseInsensitive (we ignore capital letter) compared by the NAME of the element (returning the result) by check if the name field contains the search term.
             */
            
            List(items.itemModelList.filter({
                searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
            })){ item in
                HStack{
                    Image(systemName: item.sfIcon)
                    Text(item.name)
                }
            }
            
            /*
            List(items.itemModelList){item in
                HStack{
                    Image(systemName: item.sfIcon)
                    Text(item.name)
                }
            }
             */
            
        }.onTapGesture {
            hideKeyboard()
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
