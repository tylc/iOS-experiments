//
//  ModalGroupBox.swift
//  GroupBox
//
//  Created by Enric Herce on 19/01/2021.
//

import SwiftUI

struct DetailGroupBox: View {
    var body: some View {
        VStack{
            Spacer()

            Text("Detail view")
            
            
            Image("JesusChrist")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
            
            Spacer()
        }
        
    }
}

struct ModalGroupBox_Previews: PreviewProvider {
    static var previews: some View {
        DetailGroupBox()
            //.previewLayout(.fixed(width: 300, height: 300))
    }
}
