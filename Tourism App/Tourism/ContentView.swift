//
//  ContentView.swift
//  Tourism
//
//  Created by Bhuvan Sharma on 2024-02-14.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manageSession : ManageSession
    var body: some View {
        if manageSession.user != nil {
            TabView {
                ActivitiesScreen()
                    .tabItem {
                        Label("Activities", systemImage: "contextualmenu.and.cursorarrow")
                    }
                
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
            }
        }else {
            LoginView()
        }
    }
    
}
