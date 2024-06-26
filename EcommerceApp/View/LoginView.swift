//
//  LoginView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 27/05/2024.
//

import SwiftUI

struct LoginView: View {
    @Environment(UserViewModel.self) private var userViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Sneaker Hub") // Texto
                        .foregroundStyle(.gray.gradient)
                        .font(.title2)
                        .bold()
                        .frame(width: 150, height: 150) // Tamaño del marco
                        .background(Color.white) // Fondo blanco
                        .clipShape(Circle()) // Recortar en forma de círculo
                        .overlay(Circle().stroke(Color.green, lineWidth: 2)) // Borde negro
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0) // Sombra gris
                        .padding(.top,40)
                }
                
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
                    VStack{
                        TextField("", text: $username,prompt: Text("Enter your username").foregroundStyle(.gray))
                            .foregroundStyle(.black)
                            .autocapitalization(.none)
                            .frame(height: 20)
                            .padding()
                            .background(.green.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    
                    
                    HStack{
                        Text("Password")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                    }
                    
                    SecureField("", text: $password,prompt: Text("Enter your password").foregroundStyle(.gray))
                        .foregroundStyle(.black)
                        .frame(height: 20)
                        .padding()
                        .background(.green.opacity(0.2))
                        .clipShape(.rect(cornerRadius: 10))
                        .tint(.gray)
                    
                    
                }.padding().foregroundStyle(.red)
                
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
                            Text("Go to buy!").bold()
                            Text("")
                            Image(systemName: "arrow.right").imageScale(.large).bold()
                        }
                        .font(.title2)
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(username == "" || password == "" ? .gray : .green)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding()
                        .foregroundStyle(.white)
                        
                        
                        
                    }.disabled(username == "" || password == "")
                    
                }
                
                .navigationDestination(
                    isPresented: $isActive,
                    destination:{
                        ContentView()
                            .navigationBarBackButtonHidden(true)
                            .environment(userViewModel)
                    })
                
                Text("---------------------or--------------------")
                
                NavigationLink{
                    RegisterView().navigationBarBackButtonHidden(true)
                }label: {
                    Text("Register a new account")
                        .font(.title2)
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding()
                        .foregroundStyle(.white)
                }.padding(.bottom,30)
            }.background(Color.white).foregroundStyle(.gray)
        }
        
    }
    
}

#Preview {
    LoginView().environment(UserViewModel())
}
