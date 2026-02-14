//
//  SoundsTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 14/02/26.
//

import SwiftUI
import AVKit

class SoundManager {
    static let shared = SoundManager()
    private init () { }
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case crash
        case magic
    }
    
    func playSound(_ sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}

struct SoundsTutorial: View {
    
    var body: some View {
        VStack(spacing: 20) {
            Button("play sound 1") {
                SoundManager.shared.playSound(.crash)
            }
            
            Button("play sound 2") {
                SoundManager.shared.playSound(.magic)
            }
        }
    }
}

#Preview {
    SoundsTutorial()
}
