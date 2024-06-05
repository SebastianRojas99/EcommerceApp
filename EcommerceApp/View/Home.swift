//
//  Home.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//
import SwiftUI
import UniformTypeIdentifiers

struct Home: View {
    @State private var categoryViewModel = CategoryViewModel(categoryList: categoryList)
    @State private var selectedCategory = ""
    @Environment(CartvViewModel.self) private var cartManager
    @State private var cartInProduct = myCart.count
    @Environment(UserViewModel.self) private var user
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("**Sneaker Hub** Place 👟")
                            .font(.system(size: 32))
                            .padding(.horizontal)
                        Spacer()
                        
                        HStack{
                            
                            Text("Hola! \(user.getUser()?.capitalized ?? "Invitado")")
                                }.padding(12)
                        
                        //BUTTON WITH COUNTER DELEGATE
                            CartButton()
                        
                            HStack{
                                NavigationLink {
                                    LoginView().navigationBarBackButtonHidden(true)
                                } label: {
                                    HStack {
                                        Image(systemName: "person.slash")
                                            .imageScale(.large)
                                            .font(.system(size: 25))
                                            .padding()
                                            .frame(width: 45, height: 80)
                                        
                                    }.overlay(RoundedRectangle(cornerRadius: 120).stroke(Color.green, lineWidth: 270).opacity(0.3))
                                    
                                    //MARK: BUG
                                        //.onChange(of: cartManager.products){
                                          //  cartManager.products.removeAll()
                                        //}
                                    
                                }
                            }
                            
                        }
                          
                        CategoryListView(selectedCategory: $selectedCategory)
                            .environment(cartManager)
                            
                        
                        HStack {
                            Text("Explore **\(selectedCategory)** shoes").font(.system(size: 24)).padding(.horizontal)
                            Spacer()
                            if !selectedCategory.isEmpty {
                                NavigationLink {
                                    CardSmallProduct(selectedCategory: $selectedCategory)
                                        .environment(cartManager)
                                        .navigationBarBackButtonHidden(true)
                                } label: {
                                    HStack {
                                        Image(systemName: "arrow.right")
                                            .imageScale(.large)
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                }
                            }
                        }
                        Spacer()
                        
                        ProductListView(selectedCategory: $selectedCategory)
                            .environment(cartManager)
                            .padding(.top, 40)
                    }
                }
            }
        .environment(user)
            .background(Color.white)
        }
    }

