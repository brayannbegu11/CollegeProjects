//
//  ActivityDetailsScreen.swift
//  Tourism
//
//  Created by Bhuvan Sharma on 2024-02-14.
//

import SwiftUI

struct ActivityDetailsScreen: View {
    @EnvironmentObject var manageSession : ManageSession
    var activity: Activity
    
    var body: some View {
        VStack {
            Text(activity.name)
                .font(.title)
            
            Text(activity.description)
                .padding()
            
            Text("Price: $\(activity.price)")
                .padding()
            Button(manageSession.user!.favorites.contains(where: {$0.id == activity.id}) ? "Remove from favorites" : "Add to favorites"){
                manageSession.handleFavorite(activity: activity)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}

struct ActivityDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailsScreen(activity: Activity.sampleActivities[0])
    }
}
