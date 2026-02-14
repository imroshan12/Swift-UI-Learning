//
//  ScrollViewReaderTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 14/02/26.
//

import SwiftUI

struct ScrollViewReaderTutorial: View {
    
    @State private var textFieldText: String = ""
    @State private var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .safeAreaPadding(.horizontal, 8)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
                
            
            Button("Scroll now") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.1))
                            .clipShape(ConcentricRectangle(corners: .fixed(10)))
                            .shadow(radius: 50, x: 20, y: 20)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { oldValue, newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .bottom)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderTutorial()
}
