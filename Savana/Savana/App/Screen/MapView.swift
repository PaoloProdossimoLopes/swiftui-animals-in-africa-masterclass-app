//
//  MapView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        let center = CLLocationCoordinate2D(
            latitude: 6.600286, longitude: 16.4377599)
        let span = MKCoordinateSpan(
            latitudeDelta: 70,
            longitudeDelta: 70)
        return MKCoordinateRegion(center: center, span: span)
    }()
    
    private let locations: [Location] = {
        let locales: [Location]? = try? Bundle.main.decode("locations.json")
        return locales ?? []
    }()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { location in
            //MapMarker(coordinate: location.location, tint: .accentColor) //Default annotation
            
            MapAnnotation(coordinate: location.location) {
                MapAnnotationView(location: location)
                
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 20, height: 20, alignment: .center)
            }
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
