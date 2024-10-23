//
//  TourismApp.swift
//  Tourism
//
//  Created by Bhuvan Sharma on 2024-02-14.
//

import SwiftUI

@main
struct Group12_TourismApp: App {
    var manageSesion = ManageSession()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manageSesion)
            
        }
    }
}
