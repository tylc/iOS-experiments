//
//  ImageViewModel.swift
//  PhotoGallery&Toolbar
//
//  Created by Enric Herce on 23/06/2021.
//

import Foundation

class ImageViewModel:ObservableObject{
    
    @Published var firstImage:ImageModel
    @Published var images:[ImageModel]
    
    init(){
        firstImage = ImageModel(name: "NES", description: "NES console", filter: .none)
        images = [ImageModel(name: "NES", description: "NES console", filter: .none),
                        ImageModel(name: "arcade", description: "Close view to arcade machine", filter: .none),
                        ImageModel(name: "switch", description: "Creative pic of a Nintendo Switch", filter: .none)]
    }
    
    func backupDescription (fromImage image:ImageModel) -> String{
        return image.description
    }
    
}
