//
//  LoginView.swift
//  Tourism
//
//  Created by Brayann Alejandro Benavides guillen on 2024-02-15.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var error = false
    @EnvironmentObject var manageSession : ManageSession
    
    var body : some View {
        VStack{
            TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            SecureField("Password", text: $password)
            Toggle("Remember me", isOn: $rememberMe)
            Button("Login"){
                if manageSession.checkCredentials(email: email, password: password){
                    error = false
                }else {
                    error = true
                }
                manageSession.login(email:email, password: password, rememberMe: rememberMe)
                
            }
            if error {
                Text("Incorrect email or password")
                    .foregroundColor(.red)
            }
        }
        .alert("Incorrect email or password", isPresented: $error) {
            Button("OK", role: .cancel) { }
        }
    }
    
}

