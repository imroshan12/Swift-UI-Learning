//
//  MultipleSheetsTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 14/02/26.
//

import SwiftUI

struct MultipleSheetsModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - Use binding
// 2 - Use multiple .sheets
// 3 - Use $item: Best and scalable approach

struct MultipleSheetsTutorial: View {
    
    @State private var selectedModel: MultipleSheetsModel? = nil
    @State private var showSheet: Bool = false
    @State private var showSheet2: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Sheet \(index)") {
                        selectedModel = MultipleSheetsModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
    }
}

struct NextScreen: View {
    
    let selectedModel: MultipleSheetsModel
    
    var body: some View {
        Text("This is screen for \(selectedModel.title)")
    }
}

/**1 - Binding**/
//struct NextScreen: View {
//    
//    @Binding var selectedModel: MultipleSheetsModel
//    
//    var body: some View {
//        Text("This is screen for \(selectedModel.title)")
//    }
//}

#Preview {
    MultipleSheetsTutorial()
}
