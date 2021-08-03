//
//  DestinationExample.swift
//  CustomTabBar
//
//  Created by Enric Herce on 03/08/2021.
//

import SwiftUI

struct DestinationExample: View {
    
    @State var current:Int
    
    var body: some View {
        switch current {
        case 1:
            Text("Tab1")
        case 2:
            Text("Tab2")
        case 3:
            Text("Tab3")
        case 4:
            Text("Tab4")
        case 5:
            Text("Tab5")
        default:
            Text("Default Tab")
        }
        
    }
}

struct DestinationExample_Previews: PreviewProvider {
    static var previews: some View {
        DestinationExample(current: 1)
    }
}
