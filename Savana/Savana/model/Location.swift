//
//  Location.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 12/06/23.
//

import Foundation
import MapKit

struct Location: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
