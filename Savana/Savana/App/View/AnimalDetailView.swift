//
//  AnimalDetailView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding(.vertical, 8)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    ) //Underline component in title
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                
                Group {
                    HeadingView(image: "photo.on.rectangle.angled", text: "Wolderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(image: "questionmark.circle", text: "Did you know")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(image: "info.circle", text: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(image: "map", text: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(image: "books.vertical", text: "Learn more")
                    
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
            }
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = {
        let animals: [Animal]? = try? Bundle.main.decode("animals.json")
        return animals ?? []
    }()
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}
