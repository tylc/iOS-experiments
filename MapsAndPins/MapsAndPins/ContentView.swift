//
//  ContentView.swift
//  MapsAndPins
//
//  Created by Enric Herce on 10/06/2021.
//

import SwiftUI
import MapKit


//In this tutorial, I will show you how to use the Map structure in SwiftUI and create annotations at a specific locations on the map.

struct ContentView: View {
    
    //Maps requires a start region with a zoom. So MKCoordinate Region requires this region (is a CLLocationCoordinate2d) and the zoom (span) MKCoordinateSpan
    @State var mapRegion:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.52938539857853, longitude: -0.4076639473986893), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    //Here we go with the pins. Those pins will be points of interest []. We can do it as usual:
    /**
    var pointsOfInterest:[PointofInterest] = [PointofInterest(name: "Ajuntament", location: CLLocationCoordinate2D(latitude: 39.5372859, longitude: -0.4120269)),
                                              PointofInterest(name: "Poliesportiu", location: CLLocationCoordinate2D(latitude: 39.5372859, longitude: -0.4120269)),
                                              PointofInterest(name: "Casa", location: CLLocationCoordinate2D(latitude: 39.5372859, longitude: -0.4120269))]
     */
    //But we can save some work by using .init in the coordinates. This is because we specified in the struc that coordinate is a CLLocationCoordinate. This allows us to call directly the init method using .init.
    
    var pointsOfInterest:[PointofInterest] = [PointofInterest(name: "Ajuntament", location: .init(latitude: 39.52868200876407, longitude: -0.40874755981905453)),
                                              PointofInterest(name: "Poliesportiu", location: .init(latitude: 39.52938539857853, longitude: -0.4076639473986893)),
                                              PointofInterest(name: "Casa", location: .init(latitude: 39.530903868790816, longitude: -0.4081091940776906))]
    
    var body: some View {
        
        //We can init the map in two different ways. First only with the region and with the regios, interaction modes and location. This modes is just an array where we will indicate what can do the user. Empty array is every mode available
        
        //The map even lets you follow the user’s location by passing a binding of MapUserTrackingMode like this
        //Map(coordinateRegion: $region, interactionModes: [], showsUserLocation: true, userTrackingMode: .constant(.follow))
        //Map(coordinateRegion: $mapRegion, interactionModes: [], showsUserLocation: true)
        Map(coordinateRegion: $mapRegion, annotationItems: pointsOfInterest){
            item in
                MapMarker(coordinate: item.location, tint: .red)
                /*
             MapAnnotation(coordinate: item.coordinate) {
                 RoundedRectangle(cornerRadius: 5.0)
                     .stroke(Color.purple, lineWidth: 4.0)
                     .frame(width: 30, height: 30)
             }
             */
        }
            .ignoresSafeArea()
    }
    
}

struct PointofInterest:Identifiable{
    var id = UUID()
    var name:String
    var location:CLLocationCoordinate2D
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
