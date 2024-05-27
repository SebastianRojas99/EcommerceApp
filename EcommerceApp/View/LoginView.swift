//
//  LoginView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 27/05/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var userViewModel = UserViewModel() // Use StateObject for view model lifecycle management
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false

    var body: some View {
        NavigationStack{
            VStack(alignment:.center){
                TextField("Username", text: $username)
                    .autocapitalization(.none) // Prevent automatic capitalization for usernames
                SecureField("Password", text: $password)
                
                VStack{
                    Button{
                        if userViewModel.validation(_username: username, _password: password){
                            isActive = true
                        }
                    }label: {
                        Text("ingresar")
                    }
                }}.navigationDestination(isPresented: $isActive, destination:{
                    ContentView().navigationBarBackButtonHidden(true)
                })
                

               
                }
        }
    }

#Preview {
    LoginView()
}
