//
//  editDescription.swift
//  PhotoGallery&Toolbar
//
//  Created by Enric Herce on 02/07/2021.
//

import SwiftUI

struct editDescription: View {
    //we use a second option, update info using buttons instead dynamic update
   //option 1: dinamyc update
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var image:ImageViewModel
    var currentImage:Int
    var descriptionTextBackup:String

    
    var body: some View {
        NavigationView{
            VStack{
                TextField("We are gonna change our text...", text: $image.images[currentImage].description)
                    .padding()
                    .background(Color.gray)
                    .frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            .navigationTitle("Edit Description")
            
            /*
             Instead of using the placement values we met in the previous parts, we are going to use action-related placements values. By doing so, the system will automatically place all items to the proper positions.
             */
           
            
            // extended tutorial: instead of create the toolbar here, we created in another class just to have the same toolbar in the case we need to reuse the toolbar:
            .toolbar{
                //Here we call our reusable toolbar.It's like a switch for inner items:
                /*
                 First and by default we call confirm because it's the firs ar created in the class, then cancelAction and finally destructAction
                 */
                CustomToolbar{
                    self.presentationMode.wrappedValue.dismiss()
                }cancelAction: {
                    image.images[currentImage].description = descriptionTextBackup
                    
                    self.presentationMode.wrappedValue.dismiss()
                }destructAction: {
                    image.images[currentImage].description = ""
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            // classic toolbar
            /*
            .toolbar{
                //delete description
                ToolbarItem(placement: .destructiveAction){
                    Button(action: {
                        image.images[currentImage].description = ""
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "trash.circle")
                    })
                    
                }
                //save changes
                ToolbarItem(placement: .confirmationAction){
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "checkmark.circle")
                    })
                    
                }
                //discard and dismiss
                ToolbarItem(placement: .cancellationAction){
                    Button(action: {
                        print(descriptionTextBackup)
                        
                        image.images[currentImage].description = descriptionTextBackup
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle")
                    })
                    
                }
                
            }*/
        }
    }
}
     
struct editDescription_Previews: PreviewProvider {
    static var previews: some View {
        editDescription(image:ImageViewModel(),currentImage:0,descriptionTextBackup:"" )
    }
}
