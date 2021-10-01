//
//  SwiftUIView.swift
//  AsyncImage
//
//  Created by Enric Herce on 30/9/21.
//

import SwiftUI

struct AsyncImageView: View {
    


    
    var body: some View {
        
        let url = URL(string: "https://source.unsplash.com/random/200x200")
        let transaction = Transaction(animation: Animation.easeIn(duration: 5.0))

        
        if #available(iOS 15.0, *) {
            /*
             Frame is used to the frame where the image goes. Not the image
             */
            /*AsyncImage(url: URL(string: "https://source.unsplash.com/random/200x200"))
                .frame(width: 100, height: 100)*/
            
            /*
             To change the size of our image, we will have to use another init of AsyncImage which will give us the image in completion so we can adjust its size, aspectRatio etc. We can also define...
             */
            /*
             1. content is the image provided
             2. placeholder is the empty place where the image appears when loaded
             */
           /*
            AsyncImage(url: URL(string:"https://source.unsplash.com/random/200x200"),
                       content: {
                image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            },
                       placeholder: {
                ProgressView()
            }
            )*/
            /*
             AsyncImagePhase
             If you need more control over various loading phases for image then use following init , init with AsyncImagePhase gives you more control over the view and lets you take action when image is yet to load, loaded or failed to load. Init signature looks like this:

             */
            
            AsyncImage(url: url, scale: 1.0, transaction: transaction) { imagePhase in
                        
                        switch imagePhase {
                        case .empty:
                            ProgressView()
                                .aspectRatio(contentMode: .fit)
                            
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                            
                        case .failure(let err):
                            VStack {
                                Text("Failed to load image.")
                                Text(err.localizedDescription)
                            }
                            
                        @unknown default:
                            EmptyView()
                                .aspectRatio(contentMode: .fit)
                               
                        }
                        
            }.frame(width: 60, height: 60)
            
        } else {
            // Fallback on earlier versions
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}

