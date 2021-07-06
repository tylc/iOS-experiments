//
//  ContentView.swift
//  PhotoGallery&Toolbar
//
//  Created by Enric Herce on 23/06/2021.
//

import SwiftUI

/**This tutorial will show how to create a simple gallery viewer which we will use to explore different capabilities in the toolbar.
 
    Toolbar is like any other modifier in the UI, like adding background to text or a title to a navigationView. In this case it's a modifier to the NavigationView so we'll put j.ttolbar just before the closing zone
 
    Thanks to AppCoda for the guides.
 */

struct ContentView: View {
    
    //First of all we will setup the images using MVMMModel
    @ObservedObject var listOfImages:ImageViewModel = ImageViewModel()
    //Backup text for the current image
    @State var backupText:String = ""
    
    //To show or hide the description we are going to use a State var. Also for changing image and show a modal view.
    @State var showDescription:Bool = true
    @State var current:Int = 0
    @State var showSheet = false
    @State var showActionSheet = false

    
    var body: some View {
        //NavigationView allows us to create the toolbar
        NavigationView{
            //Zstack will be used to add text over the image.
            //An aligment attribute tells us where the elements where be placed (in this case at the bottom of the screen. Like if we use a spacer in the stacks
            ZStack(alignment:.bottom){
                /*
                 The Image view has two modifiers applied to it. The first one allows the image to be resized, something that does not happen by default. The second view modifier specifies the content mode of the image view, or in other words how the image will appear in the image view. With the fit value we ensure that the image will fit in the image view respecting the original aspect ratio.
                 */
                
                Image(listOfImages.images[current].name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                
                if (showDescription){
                    Text(listOfImages.images[current].description)
                        .padding()
                        .background(Color.gray.opacity(0.7))
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                        .font(.title3)
                        
                }
            }
          
            //Classic toolbar
            .toolbar{
                //we want buttons so we define the toolbarItems, more placements int the notes at the end of this view.
                //If we want only one button to the right we can use placement:.primary but if we want more we hace to use navigationbartrailing beacause .primary is an absolute value that don't allow to have more items arround
                
                ToolbarItem(placement:.navigationBarTrailing){
                    Button (
                        action:{
                            //current = if current+1 = 3 (?) we put current to 0 else(:) +1
                            current = current + 1 == 3 ? 0 : current + 1
                            

                        },
                        label:{
                            Image(systemName: "arrowshape.turn.up.right.circle")
                            
                        }
                    )
                }
                
                //seond button: tis button will allow us to change de default description. To do this we will make a modal view instead a classic view
                ToolbarItem(placement:.navigationBarLeading){
                    Button(
                        action:{
                            backupText = listOfImages.backupDescription(fromImage: listOfImages.images[current])
                            
                            showSheet = true
                        },
                        label:{
                            Image(systemName: "pencil.circle")
                        }
                    )
                }
                //third button: show/hide description
                ToolbarItem(placement:.navigationBarTrailing){
                    
                    Button(action: {
                        //Classic if to check variable but in a coolest way
                        /*
                         if (showDescription){
                             showDescription = false
                         }
                         else{
                             showDescription = true
                         }
                         */
                        /* coolest way
                        showDescription = showDescription == true ? false : true
                        */
                        /* correct way */
                        showDescription.toggle()
                    },label: {
                      Image(systemName: "doc.plaintext")
                    })
                    
                }
                
                //BOTTOM TOOLBAR
                //we can positionate the bottom items but not as easy as the top items, we use A ToolbarItemGroup groups the content of separate toolbar items together. In the case of this demo app, it will group the two buttons defined in the two items previously. Even more, it allows to use a Spacer and therefore to layout its contents the way we desire. Here we don't have items. we have the buttons. It works as a swiftui interface and que can use sapcer, paddings, etc.
                
                ToolbarItemGroup(placement:.bottomBar){
                    
                    Button(action:{
                        showActionSheet = true
                    },label:{
                        Image(systemName: "camera.filters")
                    })
            
                    Spacer()
                    //Share in social media or whatever
                    Button(action: {
                        //convert image to data
                        guard let data = UIImage.init(named:"NES")?.jpegData(compressionQuality: 0.9) else { return }
                        /* by default  presentActivityController(with:) method are missing. Remember: we can have methods after or before the body and call ir from everywhere we wante in the body*/
                        presentActivityController(with: data)
                        
                        
                    },label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                
                }
            }
            .sheet(isPresented: $showSheet, content: {
                //listOfImages.images[current]
                
                //OPtion 1: dynamic update
                /*
                editDescription(image: listOfImages, text: listOfImages.images[current].description,currentImage:current)
                 */
     
                
                editDescription(image:listOfImages, currentImage: current, descriptionTextBackup:backupText)
            })
            
            .actionSheet(isPresented: $showActionSheet, content: {
                let sepia = ActionSheet.Button.default(Text("Sepia")){
                    listOfImages.images[current].filter = .sepia
                    
                }
                let blur = ActionSheet.Button.default(Text("Blur")){
                    listOfImages.images[current].filter = .blur
                }
                let mono = ActionSheet.Button.default(Text("Mono")){
                    listOfImages.images[current].filter = .mono
                }
                let remove = ActionSheet.Button.default(Text("Remove Filter")){
                    listOfImages.images[current].filter = .none
                }
                let cancel = ActionSheet.Button.default(Text("Cancel")){
                    showActionSheet = false
                }
                
                return ActionSheet(title: Text("Filters"), message: nil, buttons: [sepia, mono, blur, remove, cancel])

                
            })
            
            .navigationTitle("Console pics")
        }
    }
    
    
    func presentActivityController(with data: Data) {
        let controller = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(controller, animated: true, completion: nil)
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/**
 See the placement argument? This is where we specify the position of the toolbar item.
 
 The primaryAction value provided above indicates a toolbar item connected to an action used quite often, and it has a predefined position by the system. On iOS that is the trailing edge of the toolbar, while on macOS that’s the leading edge.

 There are other values to use as well, such as:

 - navigationBarLeading: It places the item on the leading edge of the toolbar.
 - navigationBarTrailing: It places the item on the trailing edge of the toolbar.
 - principal: It places the item in a prominent position, which is the center of the toolbar for iOS and macOS.
 - navigation: It places the item where navigation actions should exist. That’s by default the leading edge, which is replaced by the primaryAction placement if a system item (such as a Back button) already exists on the leading side.
 
 Note that all the above, including the primaryAction value, regard the navigation bar in iOS, not the bottom bar. For that, there is a different value to use, called bottomBar. We’ll talk about that in a while.
 
 In addition, there are other values that indicate item position based on the purpose of the action. There are available to use placements like confirmationAction, cancellationAction, or destructiveAction. Any item that is given any of these placements, is positioned automatically by the system depending on the implied action. We are going to see them in action pretty soon too.
 */
