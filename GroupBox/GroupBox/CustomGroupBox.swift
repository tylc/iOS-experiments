//
//  CustomGroupBox.swift
//  GroupBox
//
//  Created by Enric Herce on 19/01/2021.
//

import SwiftUI

struct CustomGroupBox: View {
    
    var datos:datos
    
    var body: some View {
        
        GroupBox(label: Label(datos.text, systemImage: "pencil.circle.fill")
                    .foregroundColor(.red)){
            
            VStack(alignment: .leading){
                Text(datos.date!.addingTimeInterval(600), style:.date )
                HStack{
                    Circle()
                            .fill(Color.red)
                            .frame(width: 25, height: 25)
                    Text("You can add what you want!")
                        .foregroundColor(Color.black)
                }
                Spacer()
            }
        }
        .frame(width: 300, height: 90)
    }
}

struct CustomGroupBox_Previews: PreviewProvider {
    static var previews: some View {
        CustomGroupBox(datos: datos())
    }
}
