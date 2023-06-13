//
//  MapAnnotationView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 12/06/23.
//

import SwiftUI

struct MapAnnotationView: View {
    @State private var animations: Double = .zero
    
    let location: Location
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animations))
                .opacity(1 - animations)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeIn(duration: 2).repeatForever(autoreverses: false)) {
                animations = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [Location] = try! Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

