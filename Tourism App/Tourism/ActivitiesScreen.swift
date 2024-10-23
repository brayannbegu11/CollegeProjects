//
//  ActivitiesScreen.swift
//  Tourism
//
//  Created by Bhuvan Sharma on 2024-02-14.
//
import SwiftUI

struct ActivitiesScreen: View {
    @StateObject private var dataManager = DataManager.shared
    @EnvironmentObject var manageSession : ManageSession
    
    var body: some View {
           NavigationView {
               VStack {
                   List(dataManager.activities) { activity in
                       NavigationLink(destination: ActivityDetailsScreen(activity: activity)) {
                           ActivityRow(activity: activity)
                       }
                       .listRowInsets(EdgeInsets())
                   }
                   .listStyle(PlainListStyle())
                   .navigationTitle("Activities list")
                   .navigationBarItems(trailing: Button("Logout") {
                       manageSession.logout()
                   }.foregroundColor(.red))
               }
           }
           .navigationViewStyle(StackNavigationViewStyle())
       }
   }

   struct ActivityRow: View {
       var activity: Activity
       
       var body: some View {
           HStack(spacing: 15) {
               Image(systemName: "photo") // Consider using actual images if available
                   .resizable()
                   .scaledToFit()
                   .frame(width: 50, height: 50)
                   .cornerRadius(8)
               
               VStack(alignment: .leading, spacing: 4) {
                   Text(activity.name)
                       .fontWeight(.bold)
                   Text(String(format: "$%.2f/Person", activity.price))
                       .font(.subheadline)
                       .foregroundColor(.secondary)
               }
               
               Spacer()
           }
           .padding(.vertical)
       }
   }

