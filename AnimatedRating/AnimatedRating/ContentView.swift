//
//  ContentView.swift
//  AnimatedRating
//
//  Created by Enric Herce on 2/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var rating:Int = 1
    
    var body: some View {
        VStack{
            Image("paella")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
            Text("Paella valenciana")
                .font(.title)
            Text("La paella és un guisat d'arròs, carn i verdures preparat en una paella sobre un foc, siga paeller o fogó. És originària de la marjal de l'Albufera de València, a la comarca natural de la Ribera del Xúquer, al sud de València. Es menja en qualsevol ocasió, especialment quan s'ajunten colles d'amics o famílies, dissabtes, diumenges o en festes tradicionals i és considerat el plat típic del País Valencià per excel·lència.")
                .font(.body)
                .padding(10)
            
            Spacer()
            
            Text("Valora el plat")
                .font(.system(size: 20, weight: .bold, design: .rounded))
            
            RatingView(rating: $rating)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
