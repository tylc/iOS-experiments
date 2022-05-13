//
//  CellView.swift
//  LazyPagination
//
//  Created by Enric Herce on 13/5/22.
//

import SwiftUI

struct CellView: View {
    
    var user : User

    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80.0, height: 80.0, alignment: .center)
                            .foregroundColor(.orange)
                            .padding(.all, 20)
            
            VStack(alignment: .leading, spacing: 5, content: {
                            HStack{
                                Text("First Name :")
                                    .fontWeight(.semibold)
                                Text("\(user.firstName)")

                            }
                            
                            HStack{
                                Text("Last Name :")
                                    .fontWeight(.semibold)
                                    .bold()
                                Text("\(user.lastName)")

                            }
                            
                            HStack{
                                Text("Email :")
                                    .fontWeight(.semibold)
                                Text("\(user.email)")

                            }
                            
                        })
                        .foregroundColor(.white)
        }
        
        .frame( maxWidth: .infinity)
        .ignoresSafeArea()
        //.edgesIgnoringSafeArea([.leading, .trailing])
        .background(Color.black)
        .cornerRadius(10.0)
       
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 1, email: "apoorv487@gmail.com", firstName: "Apoorv", lastName: "Garg", avatar: URL(string: "https://avatar.com")!)

        CellView(user: user)
    }
}
