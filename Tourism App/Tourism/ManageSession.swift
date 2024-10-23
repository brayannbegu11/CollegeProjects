//
//  ManageSession.swift
//  Tourism
//
//  Created by Brayann Alejandro Benavides guillen on 2024-02-15.
//

import Foundation

class ManageSession : ObservableObject {
    @Published var user : User?{
        didSet{
            saveCurrentUser()
        }
    }
    init() {
        if let userData = UserDefaults.standard.data(forKey: "currentUser"), let decodedUser = try? JSONDecoder().decode(User.self, from: userData){
            user = decodedUser
        }
    }
    func loadFavorites() {
        guard let email = user?.email else { return }
        print(email)
        
        guard let favoritesData = UserDefaults.standard.data(forKey: "favorites:\(email)") else { return }
        
        do {
            let favoritesDecoded = try JSONDecoder().decode([Activity].self, from: favoritesData)
            user?.favorites = favoritesDecoded
            print(favoritesDecoded)
        } catch {
            print("LoadFavorites(): \(error)")
        }
    }
    func login(email : String, password: String, rememberMe:Bool) {
        print("Loggin with \(email)")
        let userFound = User.exampleUsers.first{$0.email == email && $0.password == password}
        if let user = userFound {
            self.user = user
            loadFavorites()
            if rememberMe {
                UserDefaults.standard.set(user.email, forKey: "currentUser")
                saveCurrentUser()
            }else {
                UserDefaults.standard.removeObject(forKey: "currentUser")
            }
        }
    }
    
    func checkCredentials(email:String, password:String) -> Bool {
        let userFound = User.exampleUsers.first{$0.email == email && $0.password == password}
        if userFound != nil {
            return true
        }else {
            return false
        }
    }
    func logout() {
        user = nil
        UserDefaults.standard.removeObject(forKey: "currentUser")
    }
    func saveCurrentUser() {
        if let user = user, let encodedUser = try? JSONEncoder().encode(user){
            UserDefaults.standard.set(encodedUser, forKey: "currentUser")
        }
    }
    
    func handleFavorite(activity:Activity) {
        if user?.favorites.contains(where: {$0.id == activity.id}) == false{
            user?.favorites.append(activity)
            saveCurrentUser()
        } else {
            if let index = user?.favorites.firstIndex(of:activity){
                user?.favorites.remove(at: index)
                saveCurrentUser()
            }
        }
        if let email = user?.email, let favorites = try? JSONEncoder().encode(user?.favorites){
            UserDefaults.standard.setValue(favorites, forKey: "favorites:\(email)")
        }
    }
}
