//
//  VideoPlayerView.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 11/06/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let video: Video
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(file: video.id, format: "mp4"))
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal)
                , alignment: .topLeading
            )
        }
        .tint(.accentColor)
        .navigationTitle(video.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static let videos: [Video] = try! Bundle.main.decode("videos.json")
    
    static var previews: some View {
        NavigationView {
            VideoPlayerView(video: videos[0])
        }
    }
}
