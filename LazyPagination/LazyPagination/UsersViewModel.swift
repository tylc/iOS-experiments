//
//  UsersViewModel.swift
//  LazyPagination
//
//  Created by Enric Herce on 13/5/22.
//

import Foundation
import Alamofire

class UsersViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var users : [User] = []
    
    var totalPages = 0
    var page : Int = 1
    
    init() {
        getUsers()
    }
    
    //MARK: - PAGINATION
    func loadMoreContent(currentItem item: User){
        let thresholdIndex = self.users.index(self.users.endIndex, offsetBy: -1)
        if thresholdIndex == item.id, (page + 1) <= totalPages {
            page += 1
            getUsers()
        }
    }
    
    //MARK: - API CALL
    func getUsers(){
        
        let apiUrl = "https://reqres.in/api/users?page=\(page)"
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(apiUrl).responseDecodable(of: Users.self, decoder: decoder) { [weak self] (response) in
            switch response.result{
                case .success(let users):
                    self?.totalPages = users.totalPages
                    self?.users.append(contentsOf: users.data)
                case .failure(let afError):
                    print("Error : \(afError)")
                //Handle error
            }
        }
    }
    
}
