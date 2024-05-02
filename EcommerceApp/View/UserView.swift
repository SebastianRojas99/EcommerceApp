//
//  UserView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 01/05/2024.
//

import SwiftUI

struct UserView: View {
    @State private var userViewModel = UserViewModel() // Use StateObject for view model lifecycle management
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack { // Organize form elements vertically
            TextField("Username", text: $username)
                .autocapitalization(.none) // Prevent automatic capitalization for usernames

            SecureField("Password", text: $password)

            Button {
                if userViewModel.validation(_username: username, _password: password){ // Use validate function
                    NavigationLink {
                        Home()
                    } label: {
                        Text("Enter")
                    }
                } else {
                    // Handle validation failure (show alert, display error message)
                    print("Validation failed: Invalid username or password")
                }
            } label: {
                Image(systemName: "arrow.right") // Use more descriptive icon
            }
        }
        .alert(isPresented: $userViewModel.hasError) { // Bind alert presentation to view model
            Alert(title: Text("Login Error"),
                  message: Text(userViewModel.errorMessage ?? "An unknown error occurred."), // Provide default message
                  dismissButton: .default(Text("OK")))
        }
    }
}
#Preview {
    UserView()
}

