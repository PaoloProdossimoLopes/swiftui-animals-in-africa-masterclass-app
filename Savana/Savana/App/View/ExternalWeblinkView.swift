//
//  ExternalWeblinkView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: Animal
    
    var url: URL {
        let defaultURL = URL(string: "https://wikipedia.org")!
        let animalURL = URL(string: animal.link)
        return animalURL ?? defaultURL
    }
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: url)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = try! Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
