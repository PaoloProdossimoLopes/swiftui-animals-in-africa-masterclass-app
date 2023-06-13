//
//  Video.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 11/06/23.
//

import Foundation

struct Video: Identifiable, Decodable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
