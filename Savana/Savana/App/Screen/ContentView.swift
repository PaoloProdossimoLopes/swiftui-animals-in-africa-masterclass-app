//
//  ContentView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 09/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isGridViewActive = false
    
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    private let hapitcs = UIImpactFeedbackGenerator(style: .rigid)
    private let animals: [Animal] = {
        let animals: [Animal]? = try? Bundle.main.decode("animals.json")
        return animals ?? []
    }()
    
    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
            print("Grid Number: \(gridColumn)")
        }
        
        // TOOLBAR IMAGE
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if (!isGridViewActive) {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)) //removes the row padding
                            .scaledToFill()
                        
                        ForEach(animals) { animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal)
                            ) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    Image(animal.image)
                                      .resizable()
                                      .scaledToFit()
                                      .cornerRadius(12)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn, value: gridColumn)
                    }
                }
            }
            .navigationTitle("Africa")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            hapitcs.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })
                        
                        Button(action: {
                            isGridViewActive = true
                            hapitcs.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
