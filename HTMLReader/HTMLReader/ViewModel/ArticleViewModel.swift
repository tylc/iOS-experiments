//
//  ArticleViewModel.swift
//  HTMLReader
//
//  Created by Enric Herce on 12/5/22.
//

import Foundation
import SwiftSoup

class ArticleViewModel: ObservableObject {
    
    @Published var articleList: [Article]
    let baseURL = URL(string: "https://www.swiftbysundell.com")
    
    init() {
        articleList = [Article]()
        fetchArticles()
    }
    
    func fetchArticles(){
        
        let articleURL:URL = baseURL!.appendingPathComponent("articles")
        
        do{
            let websiteString = try String(contentsOf: articleURL)
            let document = try SwiftSoup.parse(websiteString)
            let articles = try document.getElementsByClass("item-list").select("article")
            
            for article in articles{
                let title = try article.select("a").first()?.text(trimAndNormaliseWhitespace: true) ?? ""
                guard let baseURL = baseURL else {
                    return
                }
                let url = try baseURL.appendingPathComponent(article.select("a").attr("href"))
                let dateString = try article.select("div").select("span").text()
                    .replacingOccurrences(of: "Published on ", with: "")
                    .replacingOccurrences(of: "Remastered on ", with: "")
                    .replacingOccurrences(of: "Answered on ", with: "")
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                
                let formatter = DateFormatter()
                formatter.dateFormat = "MMM dd,yyyy"
                let date = Calendar.current.startOfDay(for: formatter.date(from: dateString) ?? Date.now)

                let post = Article(title: title, url: url, publishDate: date)
                self.articleList.append(post)
            }
        } catch {
            print ("An error happened")
        }
    }
    
    func todayArticles() -> [Article]{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        let todayDate: String = formatter.string(from: Date())
        
        var todayArticles: [Article] = [Article]()
        
        self.articleList.forEach{
            if $0.publishDate.description == todayDate{
                todayArticles.append($0)
            }
        }
        return todayArticles
    }
    
    func isTodayArticles() -> Bool{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        let todayDate: String = formatter.string(from: Date())
        
        var isTodayArticles: Bool = false
        
        self.articleList.forEach{
            if $0.publishDate.description == todayDate{
                isTodayArticles = true
            }
        }
        return isTodayArticles
    }
}
