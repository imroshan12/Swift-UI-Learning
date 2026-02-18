//
//  EscapingClosuresTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 17/02/26.
//

import SwiftUI
import Combine

class ExcapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] returnedData in
            self?.text = returnedData.data
        }
    }
    
    func downloadData() -> String {
        return "New data"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> Void

struct EscapingClosuresTutorial: View {
    
    @StateObject var viewModel = ExcapingViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

#Preview {
    EscapingClosuresTutorial()
}
