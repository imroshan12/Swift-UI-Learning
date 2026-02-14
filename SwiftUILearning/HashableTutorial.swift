//
//  HashableTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 14/02/26.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableTutorial: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Three"),
        MyCustomModel(title: "Four")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    HashableTutorial()
}
