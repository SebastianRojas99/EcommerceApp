//
//  RegisterView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 29/05/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var userViewModel = UserViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Sneaker Hub") // Texto
                        .foregroundStyle(.gray)
                        .font(.title2)
                        .bold()
                        .frame(width: 150, height: 150) // Tamaño del marco
                        .background(Color.white) // Fondo blanco
                        .clipShape(Circle()) // Recortar en forma de círculo
                        .overlay(Circle().stroke(Color.green, lineWidth: 2)) // Borde negro
                        .shadow(color: .royal, radius: 10, x: 0, y: 0) // Sombra gris
                        .padding(.top,40)
                }
                
                
                
                
                
                
                VStack(alignment:.leading){
                    HStack(){
                        Text("Register")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.green)
                            .opacity(0.7)
                            .frame(alignment:.leading)
                        Spacer()
                    }.padding()
                    
                }
                
                HStack{
                    
                    VStack(alignment:.leading){
                        Text("Name")
                            .font(.title2)
                            .foregroundStyle(.gray)
                            .frame(alignment: .leading)
                        Spacer()
                        TextField("", text: $username,prompt: Text("Enter name").foregroundStyle(.gray))
                            .autocapitalization(.none)
                            .frame(height: 20)
                            .padding()
                            .background(.green.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 10))
                           
                    }.padding(.horizontal,5)
                    
                    VStack(alignment:.leading){
                        Text("Lastname")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                        TextField("", text: $username,prompt: Text("Enter lastname").foregroundStyle(.gray))
                            .autocapitalization(.none)
                            .frame(height: 20)
                            .padding()
                            .background(.green.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 10))
                           
                    }.padding(.horizontal,5)
                }.padding(.top,20)
                
                
                
                VStack{
                    HStack{
                        Text("Username")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    TextField("", text: $username,prompt: Text("Enter username").foregroundStyle(.gray))
                        .autocapitalization(.none)
                        .frame(height: 20)
                        .padding()
                        .background(.green.opacity(0.2))
                        .clipShape(.rect(cornerRadius: 10))
                    
                    HStack{
                        Text("Password")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                    }
                    
                    SecureField("", text: $password,prompt: Text("Enter password").foregroundStyle(.gray))
                        .frame(height: 20)
                        .padding()
                        .background(.green.opacity(0.2))
                        .clipShape(.rect(cornerRadius: 10))
                    
                    
                }.padding().foregroundStyle(.gray)
                
                HStack{
                    Spacer()
                    NavigationLink{
                        LoginView().navigationBarBackButtonHidden(true)
                    }label: {
                        Text("Have account?, Sign In!")
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
                            Text("Register now!").bold()
                            Text("")
                            Image(systemName: "arrow.right").imageScale(.large).bold()
                        }
                        .font(.title2)
                        .padding(22)
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .clipShape(.rect(cornerRadius: 15))
                        .padding()
                        .foregroundStyle(.white)
                        
                        
                        
                    }
                    
                }
                
                .navigationDestination(
                    isPresented: $isActive,
                    destination:{
                        ContentView()
                            .navigationBarBackButtonHidden(true)
                    })
            }.background(Color.white).foregroundStyle(.gray)
        }
        
        }
    
    }

#Preview {
    RegisterView()
}
