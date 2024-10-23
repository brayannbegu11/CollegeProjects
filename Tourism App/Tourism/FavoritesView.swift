//
//  FavoritesView.swift
//  Tourism
//
//  Created by Brayann Alejandro Benavides guillen on 2024-02-15.
//

import SwiftUI

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var manageSession : ManageSession
    
    var body: some View {
        if(manageSession.user != nil){
            NavigationView {
                VStack {
                    List(manageSession.user!.favorites) { activity in
                        NavigationLink(destination: ActivityDetailsScreen(activity: activity)) {
                            ActivityRow(activity: activity)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("Favorites List")
                    .navigationBarItems(trailing: Button("Logout") {
                        manageSession.logout()
                    }.foregroundColor(.red))
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        }
        
    }


struct FavoriteRow: View {
    var activity: Activity
    
    var body: some View {
        HStack(spacing: 15) {
                    Image(systemName: "photo") // Replace "photo" with your actual image name
                        .resizable()
                        .frame(width: 50, height: 50) // Adjust size as needed
            
                    VStack(alignment: .leading, spacing: 4) {
                        Text(activity.name)
                        Text(String(format: "$%.2f/Person", activity.price))
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding()
        
        
            }
}
