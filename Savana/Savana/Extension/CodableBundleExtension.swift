//
//  CodableBundleExtension.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import Foundation

extension Bundle {
    private struct NotFoundResourceError: Error {}
    
    func decode<T: Decodable>(_ file: String, decoder: JSONDecoder = JSONDecoder()) throws -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            throw NotFoundResourceError()
        }
        
        
        let data = try Data(contentsOf: url)
        return try decoder.decode(T.self, from: data)
    }
}
