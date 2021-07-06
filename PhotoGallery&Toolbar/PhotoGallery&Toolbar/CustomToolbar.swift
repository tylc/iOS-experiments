//
//  CustomToolbar.swift
//  PhotoGallery&Toolbar
//
//  Created by Enric Herce on 06/07/2021.
//

/**
 An extension for the project, just for learning, is this: Instead of create a toolbar for every view, if we share the same toolbar we can create a toolbar just to call to every view it needed.
 It's the same as we do to create new views, but instead of creating a body:some view, we create a body: some toolbarContent. Also, when we create this toolbar in the actions we make, as far as we don't know what we'll do, we call empty functions previously created as a var metod()->void
 */


import SwiftUI

struct CustomToolbar: ToolbarContent {
    
    var confirmAction: () -> Void
    var cancelAction: () -> Void
    var destructAction: () -> Void
    
    var body: some ToolbarContent{
        
        //Here we create the different toolbaritems:
        /*
         ToolbarItem(placement:){
         //what contains
            Button(
                action:{the method. We will write the method so the begaviour in the views we call the toolbar.}
                .label:{aesthetics}
            )
         }
         
         */
        ToolbarItem(placement: .destructiveAction) {
            Button(action: {
                destructAction()
            }, label: {
                Image(systemName: "trash.circle")
            })
        }
         
        ToolbarItem(placement: .confirmationAction) {
            Button(action: {
                confirmAction()
            }, label: {
                Image(systemName: "checkmark.circle")
            })
        }
         
        ToolbarItem(placement: .cancellationAction) {
            Button(action: {
                cancelAction()
            }, label: {
                Image(systemName: "xmark.circle")
            })
        }
    }
}
