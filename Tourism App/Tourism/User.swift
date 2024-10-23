//
//  User.swift
//  Tourism
//
//  Created by Brayann Alejandro Benavides guillen on 2024-02-15.
//

import Foundation

struct User: Codable {
    var id = UUID()
    var email:String
    var password:String
    var favorites : [Activity] = []
    
    static let exampleUsers = [
        User(email: "1", password: "1"),
        User(email: "2", password: "2")
    ]
}
