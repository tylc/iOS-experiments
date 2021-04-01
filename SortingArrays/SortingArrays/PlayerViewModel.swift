//
//  PlayerViewModel.swift
//  SortingArrays
//
//  Created by Enric Herce on 01/04/2021.
//

import Foundation

class PlayerViewModel:ObservableObject{
    
    @Published var listOfPlayers:[Player] = [Player]()
    
    init(){
        listOfPlayers=[Player(name: "Leo Messi", position: "Striker", number: 10),
                       Player(name: "Ousmane Dembele", position: "Striker", number: 11),
                       Player(name: "Gerard Piqué", position: "Defense", number: 3),
                       Player(name: "Marc André Ter Stegen", position: "GoalKeeper", number: 1)]
    }
    
    /*
     This will compare the first element lhs.name > rhs.name and if lhs.name == rhs.name, we compare the rest in order: (lhs.position, lhs.number) > (rhs.position, rhs.number)
     
     We put in the first place the base element to sort (name, number, etc.)
     */
    func sortByName(){
        let sorted = listOfPlayers.sorted{ (lhs, rhs) -> Bool in
            return (lhs.name, lhs.position, lhs.number) < (rhs.name, rhs.position, rhs.number)
        }
        
        listOfPlayers = sorted
        
        print (sorted)
        
        
    }
    /*
     Here we sort by number
     */
    func sortByNumber(){
        let sorted = listOfPlayers.sorted{ (lhs, rhs) -> Bool in
            return (lhs.number, lhs.name, lhs.position) < (rhs.number, rhs.name, rhs.position)
        }
        listOfPlayers = sorted
        print (sorted)
    }

    
    
}
