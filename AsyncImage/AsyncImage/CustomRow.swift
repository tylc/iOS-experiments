//
//  CustomRow.swift
//  AsyncImage
//
//  Created by Enric Herce on 30/9/21.
//

import SwiftUI

struct CustomRow: View {
    var text:String
    var subtext:String
    
    var body: some View {
        
        HStack{
            AsyncImageView()
                
            VStack(alignment: .leading){
                Text ("Here we've text")
                Text ("Here we've subtext")
                    .font(.caption)
            }.padding()
            
        }
    }
}

struct CustomRow_Previews: PreviewProvider {
    static var previews: some View {
        CustomRow(text: "Here we goes some text", subtext: "Here we gos some subtext")
    }
}
