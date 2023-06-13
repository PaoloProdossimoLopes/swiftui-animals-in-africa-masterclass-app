//
//  CoverImageView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import SwiftUI

struct CoverImageView: View {
    
    let covers: [Cover] = {
        let decoded: [Cover]? = try? Bundle.main.decode("covers.json")
        return decoded ?? []
    }()
    
    var body: some View {
        TabView{
            ForEach(covers) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
