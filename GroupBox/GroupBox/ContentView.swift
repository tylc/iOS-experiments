//
//  ContentView.swift
//  GroupBox
//
//  Created by Enric Herce on 19/01/2021.
//

import SwiftUI


 struct ContentView: View {
    var exampledata:datos = datos()
    var body: some View {
        NavigationView{
           
            VStack{
               
                NavigationLink(destination:DetailGroupBox()){
                    CustomGroupBox(datos: exampledata)
                }.background(Color(.systemGroupedBackground)).edgesIgnoringSafeArea(.bottom)
                Spacer()
            }
            .padding()
            .navigationBarTitle("Custom Group Box:")
        }
        
    }
}
 
 struct datos{
     var text:String
     var color:UIColor
     var date:Date?
     
     init() {
         self.text = "Customized GroupBox"
         self.color = UIColor.systemRed
         self.date = Date()
     }
 }
 
