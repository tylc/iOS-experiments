//
//  RatingView.swift
//  AnimatedRating
//
//  Created by Enric Herce on 2/5/22.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating:Int
    
    var body: some View {
        ZStack (alignment: .leading){
            HStack(spacing: 5){
                ForEach(1..<6){ index in
                    Image(systemName: "flame.fill")
                        .font(.largeTitle)
                        .foregroundColor(rating >= index ? .red : .gray)
                        .onTapGesture {
                            withAnimation {
                                rating = index
                            }
                        }
                }
            }
            
            
        }
        
    }
    
    
    private var overlayView: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(
                        LinearGradient(colors: [.yellow, .orange, .red],
                                       startPoint: .leading,
                                       endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * proxy.size.width)
            }
        }
        .allowsHitTesting(false)
    }
}



struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(1))
    }
}
