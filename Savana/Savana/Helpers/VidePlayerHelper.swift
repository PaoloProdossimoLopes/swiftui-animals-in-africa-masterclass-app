//
//  VidePlayerHelper.swift
//  Savana
//
//  Created by Paolo Prodossimo Lopes on 11/06/23.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(file: String, format: String) -> AVPlayer {
    if let videoUrl = Bundle.main.url(forResource: file, withExtension: format) {
        videoPlayer = AVPlayer(url: videoUrl)
        videoPlayer?.play()
    }
    
    return videoPlayer!
}
