//
//  GalleryView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal = "lion"
    
    private let animals: [Animal] = {
        let ani: [Animal]? = try? Bundle.main.decode("animals.json")
        return ani ?? []
    }()
    
    private let coluns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 8)
                    )
                
                LazyVGrid(columns: coluns, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = animal.image
                            }
                    }
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
                .ignoresSafeArea(.all)
        )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
