//
//  LongPressGestureTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 11/02/26.
//

import SwiftUI

struct LongPressGestureTutorial: View {
    
    @State private var isCompleted: Bool = false
    @State private var isSuccess: Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? .green :.blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("Click Here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) { isPressing in
                        // START OF THE PRESS TO THE MIN DURATION
                        if isPressing && !isSuccess {
                            withAnimation(.easeInOut(duration: 1)) {
                                isCompleted.toggle()
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isCompleted = false
                                    }
                                }
                            }
                        }
                    } perform: {
                        // AT THE MIN DURATION
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
                
                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isCompleted = false
                        isSuccess = false
                    }
                    
            }
                
        }
    }
}

#Preview {
    LongPressGestureTutorial()
}
