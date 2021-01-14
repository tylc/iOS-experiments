//
//  MenuView.swift
//  FloatingMenu
//
//  Created by Enric Herce on 13/01/2021.
//

import SwiftUI

struct MenuView: View {
    
    let mainButton: menuButton
    let secondaryButtons: [menuButton]
    
    @State private var isShowed = false
    private let buttonSize: CGFloat = 50
    
    @State private var showAlert = false

    var body: some View {
      
        VStack {
            ForEach(secondaryButtons){ item in
                Button(item.text, action:{
                    print ("Button tapped \(item.id)")
                })
                .frame(
                    width: self.isShowed ? self.buttonSize:0,
                    height: self.isShowed ? self.buttonSize:0
                )
            }
            
            Button(mainButton.text, action:{
                withAnimation{
                    self.isShowed.toggle()
                }
            })
            .frame(width: 50.0, height: 50.0)
        }
        .background(Color.black)
        .cornerRadius(35.0)
        .shadow(
            color: Color.gray,
            radius: 3
        )
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(mainButton: menuButton(id: 1, text: "b0"), secondaryButtons: [menuButton(id: 2, text: "b1")])
    }
}
