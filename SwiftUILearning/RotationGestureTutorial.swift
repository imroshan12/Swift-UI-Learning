//
//  RotationGestureTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 12/02/26.
//

import SwiftUI

struct RotationGestureTutorial: View {
    
    @State private var angle: Angle = .degrees(0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
            .background(Color.blue)
            .clipShape(ConcentricRectangle(corners: .fixed(20)))
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        angle = value.rotation
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = .degrees(0)
                        }
                    }
            )
        
    }
}

#Preview {
    RotationGestureTutorial()
}
