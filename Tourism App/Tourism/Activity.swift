//
//  Activity.swift
//  Tourism
//
//  Created by Bhuvan Sharma on 2024-02-14.
//

import Foundation
struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var price: Double
    var hostedBy: String
    
    init(name: String, description: String, price: Double, hostedBy: String) {
        self.name = name
        self.description = description
        self.price = price
        self.hostedBy = hostedBy
    }
    
    // For demonstration purposes
        static var sampleActivities: [Activity] = [
            Activity(name: "City Tour", description: "Explore the city landmarks", price: 40.0, hostedBy: "Guru Randhawa"),
            Activity(name: "Photography Walk", description: "Raise your Toronto experience with the Downtown Photo Walk", price: 80.0, hostedBy: "Justin Miller"),
            Activity(name: "Cuisine Tasting", description: "Taste regional meals", price: 30.0, hostedBy: "")
        ]
    
    
}
