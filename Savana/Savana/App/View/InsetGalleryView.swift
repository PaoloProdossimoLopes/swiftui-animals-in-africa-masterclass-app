//
//  InsetGalleryView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import SwiftUI

struct InsetGalleryView: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(0 ..< animal.gallery.count, id: \.self) { index in
                    Image(animal.gallery[index])
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = {
        let animals: [Animal]? = try? Bundle.main.decode("animals.json")
        return animals ?? []
    }()
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
