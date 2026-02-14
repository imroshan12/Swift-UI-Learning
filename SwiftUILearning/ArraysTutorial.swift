//
//  ArraysTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 14/02/26.
//

import SwiftUI
import Combine

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let point: Int
    let isVerfied: Bool
}

class ArrayModificationViewModal: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Sarvesh", point: 29, isVerfied: true)
        let user2 = UserModel(name: "Amit", point: 7, isVerfied: false)
        let user3 = UserModel(name: "Ankit", point: 56, isVerfied: true)
        let user4 = UserModel(name: "Rakesh", point: 3, isVerfied: false)
        let user5 = UserModel(name: nil, point: 23, isVerfied: true)
        let user6 = UserModel(name: "Rishabh", point: 13, isVerfied: false)
        let user7 = UserModel(name: "Deepak", point: 86, isVerfied: true)
        let user8 = UserModel(name: "Divi", point: 12, isVerfied: true)
        let user9 = UserModel(name: "Samad", point: 13, isVerfied: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9
        ])
    }
    
    func updateFilteredArray() {
        //        SORT
        /**
         filteredArray = dataArray.sorted { user1, user2 in
         user1.point > user2.point
         }
         */
        
        //        FILTER
        /**
         filteredArray = dataArray.filter({ user in
         user.point > 50
         })
         */
        
        //        MAP
        /**
         mappedArray = dataArray.map({ user -> String in
         return user.name ?? "Error"
         })
         
         mappedArray = dataArray.compactMap({ user in
         user.name
         })
         */
        
        mappedArray = dataArray
                        .sorted(by: { $0.point > $1.point})
                        .filter({ $0.isVerfied })
                        .compactMap({ $0.name })
        
    }
}

struct ArraysTutorial: View {
    
    @StateObject var vm = ArrayModificationViewModal()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                        HStack {
//                            Text("Point: \(user.point)")
//                            Spacer()
//                            if user.isVerfied {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(.blue)
//                    .clipShape(ConcentricRectangle(corners: .fixed(10)))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysTutorial()
}
