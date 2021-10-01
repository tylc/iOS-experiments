//
//  ContentView.swift
//  AsyncImage
//
//  Created by Enric Herce on 30/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            CustomRow(text: "First image", subtext: "Caption for the image")
            CustomRow(text: "Second image", subtext: "Caption for the image")
            CustomRow(text: "Third image", subtext: "Caption for the image")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

