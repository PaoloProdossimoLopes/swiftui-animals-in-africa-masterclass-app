//
//  InsetMapView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    @State private var region: MKCoordinateRegion = {
        let regionSpan = MKCoordinateSpan(
            latitudeDelta: 30, longitudeDelta: 30
        ) // zoom level
        let regionCenter = CLLocationCoordinate2D(
            latitude: 6.600286, longitude: 16.4377599
        ) // local at point
        let region = MKCoordinateRegion(
            center: regionCenter, span: regionSpan
        )
        return region
    }()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin")
                            .foregroundColor(.accentColor)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black.opacity(0.4)
                            .cornerRadius(8)
                    )
                }
                    .padding(12)
                ,alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
