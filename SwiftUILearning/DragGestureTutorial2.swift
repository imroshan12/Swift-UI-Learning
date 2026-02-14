//
//  DragGestureTutorial2.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 12/02/26.
//

import SwiftUI

struct DragGestureTutorial2: View {
    
    @State private var startingOffSetY: CGFloat = 0
    @State private var currentDragOffSetY: CGFloat = 0
    @State private var endingOffsetY: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.green.ignoresSafeArea()
                
                SignUpView()
                    .offset(y: startingOffSetY)
                    .offset(y: currentDragOffSetY)
                    .offset(y: endingOffsetY)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    currentDragOffSetY = value.translation.height
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    if currentDragOffSetY < -150 {
                                        endingOffsetY = -startingOffSetY
                                    } else if endingOffsetY != 0 && currentDragOffSetY > 150 {
                                        endingOffsetY = 0
                                    }
                                    currentDragOffSetY = 0
                                }
                            }
                    )
                
                Text("\(currentDragOffSetY)")
                
            }
            .ignoresSafeArea(edges: .bottom)
            .onAppear {
                startingOffSetY = geometry.size.height * 0.95
            }
        }
        
    }
}

struct SignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description for my app. Please sign up to continue.")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(.black)
                .clipShape(ConcentricRectangle(corners: .fixed(10)))
                
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(ConcentricRectangle(corners: .fixed(20)))
        .foregroundStyle(.black)
    }
}

#Preview {
    DragGestureTutorial2()
}
