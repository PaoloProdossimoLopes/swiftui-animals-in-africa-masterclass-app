//
//  Animal.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import Foundation

struct Animal: Identifiable, Decodable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
