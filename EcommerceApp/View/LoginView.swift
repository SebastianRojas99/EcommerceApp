//
//  LoginView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 27/05/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var userViewModel = UserViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false

    var body: some View {
        NavigationStack{
            
            VStack{
                Text("Sneaker Hub") // Texto
                    .font(.title2)
                    .bold()
                    .frame(width: 150, height: 150) // Tamaño del marco
                    .background(Color.white) // Fondo blanco
                    .clipShape(Circle()) // Recortar en forma de círculo
                    .overlay(Circle().stroke(Color.green, lineWidth: 2)) // Borde negro
                    .shadow(color: .gray, radius: 10, x: 0, y: 0) // Sombra gris
            }
            
            
            
            
            VStack(alignment:.center){
                
                VStack(alignment:.leading){
                    HStack(){
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.green)
                            .opacity(0.7)
                            .frame(alignment:.leading)
                        Spacer()
                    }.padding()
                    
                }
                VStack{
                    HStack{
                        Text("Username")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    TextField("Enter your username", text: $username)
                        .autocapitalization(.none)
                        .frame(height: 20)
                        .padding()
                        .background(.green.opacity(0.2))
                        .clipShape(.rect(cornerRadius: 30))
                    
                    HStack{
                        Text("Password")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                    }
                    
                    SecureField("Enter your password", text: $password)
                        .frame(height: 20)
                        .padding()
                        .background(.green.opacity(0.2))
                        .clipShape(.rect(cornerRadius: 30))
                    
                    
                }.padding()
                
                HStack{
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Forgot the password?")
                            .foregroundStyle(.gray)
                    }
                }.padding()
                
                VStack{
                    
                    Button{
                        if userViewModel.validation(_username: username, _password: password){
                            isActive = true
                        }
                    }label: {
                        HStack{
                            Text("Go to buy!")
                            Text("")
                            Image(systemName: "arrow.right").imageScale(.large)
                        }
                        .font(.title3)
                        .padding(22)
                        .frame(maxWidth: .infinity)
                        .background(.royal)
                        .clipShape(.rect(cornerRadius: 40))
                        .padding()
                        .foregroundStyle(.white)
                        
                            
                        
                    }
                    
                }
            }.navigationDestination(
                    isPresented: $isActive,
                    destination:{
                    ContentView()
                            .navigationBarBackButtonHidden(true)
                })}
        
        }
    
    }

#Preview {
    LoginView()
}
