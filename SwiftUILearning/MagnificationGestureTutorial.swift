//
//  MagnificationGestureTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 11/02/26.
//

import SwiftUI

struct MagnificationGestureTutorial: View {
    
    @State private var currentAmount: CGFloat = 0
    @State private var lastAmount: CGFloat = 0
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("Sarvesh Roshan")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(min(1 + currentAmount, 3))
                .gesture(
                    MagnifyGesture()
                        .onChanged { value in
                            currentAmount = value.magnification - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring) {
                                currentAmount = 0
                            }
                        }
                )
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.title)
            Text("This is the caption for my photo")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(.red)
//            .clipShape(ConcentricRectangle(corners: .fixed(20)))
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnifyGesture()
//                    .onChanged{ value in
//                        currentAmount = value.magnification - 1
//                    }
//                    .onEnded { value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
    }
}

#Preview {
    MagnificationGestureTutorial()
}
