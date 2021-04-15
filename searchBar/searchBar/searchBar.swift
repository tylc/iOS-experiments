//
//  searchBar.swift
//  searchBar
//
//  Created by Enric Herce on 15/04/2021.
//

import SwiftUI

struct searchBar: View {
    @Binding var text:String
    @State var isEditing:Bool = false
    
    var body: some View {
        HStack{
            TextField("Search...", text: $text)
                .padding(10)
                .padding(.horizontal, 25)
                
                .background(Color(.systemGray6))
                .cornerRadius(10.0)
                
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                
                .padding(.horizontal, 10)
                
                .onTapGesture {
                    isEditing = true
                }
            if (isEditing){
                Button(action:{
                    self.isEditing = false
                    self.text = ""
                }){
                    Text("Cancel")
                        .padding(.trailing, 15)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                }
            }
            
            
        }
    }
}

struct searchBar_Previews: PreviewProvider {
    static var previews: some View {
        searchBar(text: .constant(""), isEditing: false)
    }
}
