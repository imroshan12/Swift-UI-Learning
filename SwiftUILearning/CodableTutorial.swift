//
//  CodableTutorial.swift
//  SwiftUILearning
//
//  Created by Sarvesh Roshan on 18/02/26.
//

import SwiftUI
import Combine

// Codable = Decodable + Encodable

struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
    init(id: String, name: String, points: Int, isPremium: Bool) {
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
    }
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.id, forKey: .id)
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.points, forKey: .points)
//        try container.encode(self.isPremium, forKey: .isPremium)
//    }
}

class CodableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//            let dictionary = localData as? [String: Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool {
//            
//            self.customer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//        }
        
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
    }
    
    func getJSONData() -> Data? {
//        let dictionary: [String: Any] = [
//            "id": "12345",
//            "name": "Sarvesh",
//            "points": 34,
//            "isPremium": true
//        ]
        
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary)
        
        let customer = CustomerModel(id: "233", name: "Sarvesh", points: 12, isPremium: true)
        let jsonData = try? JSONEncoder().encode(customer)
        return jsonData
    }
}

struct CodableTutorial: View {
    
    @StateObject private var viewModel: CodableViewModel = .init()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = viewModel.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableTutorial()
}
