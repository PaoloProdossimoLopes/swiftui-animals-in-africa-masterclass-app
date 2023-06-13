//
//  VideoListView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 10/06/23.
//

import SwiftUI

struct VideoListView: View {
    
    @State private var videos: [Video] = {
        let v: [Video]? = try? Bundle.main.decode("videos.json")
        return v ?? []
    }()
    
    private let impact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(video: video)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: shaffleVideos) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
    
    func shaffleVideos() {
        impact.impactOccurred()
        videos.shuffle()
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
