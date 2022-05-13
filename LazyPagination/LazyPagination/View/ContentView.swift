//
//  ContentView.swift
//  LazyPagination
//
//  Created by Enric Herce on 13/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var usersVM = UsersViewModel()

    
    var body: some View {
        //lazy view embebida en una scrollview
        /*List{
            CellView()
                .listRowBackground(Color.green)
        }*/
        //.frame( maxWidth: .infinity)
        //.listStyle(GroupedListStyle())
        //.listStyle(GroupedListStyle())
        NavigationView{
                    ScrollView {
                        LazyVStack {
                            ForEach(usersVM.users, id: \.self) { user in
                                CellView(user: user)
                                    .onAppear(){
                                        usersVM.loadMoreContent(currentItem: user)
                                    }
                            }
                        }
                    }
                    .navigationTitle("Users")
                    
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}
