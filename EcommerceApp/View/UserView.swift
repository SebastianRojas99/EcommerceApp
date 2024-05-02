//
//  UserView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 01/05/2024.
//

import SwiftUI

struct UserView: View {
    @State var userViewModel = UserViewModel()
    @State var user:String
    @State var password:String
    var body: some View {
        TextField("Username", text: $user)
        SecureField("Password", text: $password)
        Button{
            let validated = userViewModel.validation(_username: user, _password: password)
            if validated{
                NavigationLink{
                    Home()
                }label: {
                    Text("Enter")
                }
            }
        }label: {
            Image(systemName: "arrow")
        }
    }
}

#Preview {
    UserView(user: "seba", password: "123")
}

