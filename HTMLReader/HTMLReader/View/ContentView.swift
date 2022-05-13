//
//  ContentView.swift
//  HTMLReader
//
//  Created by Enric Herce on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @ObservedObject var articleList:ArticleViewModel = ArticleViewModel()
    
    var searchResults: [Article] {
        if searchText.isEmpty {
            return articleList.articleList
        } else {
            return articleList.articleList.filter { $0.title.contains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if !articleList.isTodayArticles() {
                    Text ("no articles today")
                }
                
                List {
                    // 2.
                    Section(header:
                                Text("Old posts")) {
                        ForEach(searchResults, id: \.self) { article in
                            Text(article.title)
                        }
                    }
                }
                .navigationBarTitle("HTML Wrapper", displayMode: .inline)
                .searchable(text: $searchText)
                /*
                 List(articleList.articleList){ article in
                 Text(article.title)
                 } .searchable(text: $searchText)
                 */
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
