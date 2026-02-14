//
//  HapticsTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 14/02/26.
//

import SwiftUI

class HapticsManager {
    static let shared = HapticsManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsTutorial: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("success") {
                HapticsManager.shared.notification(type: .success)
            }
            
            Button("warning") {
                HapticsManager.shared.notification(type: .warning)
            }
            
            Button("error") {
                HapticsManager.shared.notification(type: .error)
            }
            
            Divider()
            
            Button("soft") {
                HapticsManager.shared.impact(style: .soft)
            }
            Button("light") {
                HapticsManager.shared.impact(style: .light)
            }
            Button("medium") {
                HapticsManager.shared.impact(style: .medium)
            }
            Button("heavy") {
                HapticsManager.shared.impact(style: .heavy)
            }
            Button("rigid") {
                HapticsManager.shared.impact(style: .rigid)
            }
        }
    }
}

#Preview {
    HapticsTutorial()
}
