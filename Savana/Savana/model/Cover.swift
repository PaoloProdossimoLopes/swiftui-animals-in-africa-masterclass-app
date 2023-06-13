//
//  Cover.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import Foundation

struct Cover: Identifiable, Codable {
    let id: Int
    let name: String
}

import SwiftUI

extension Cover {
    var image: Image {
        Image(name)
    }
}
