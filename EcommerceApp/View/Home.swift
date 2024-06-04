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
    @State private var cartInProduct = myCart
    @Environment(UserViewModel.self) private var user
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("**Sneaker Hub** Place 👟")
                            .font(.system(size: 32))
                            .padding(.trailing)
                        Spacer()
                        NavigationLink {
                            CartView()
                                .environment(cartManager)
                        } label: {
                            HStack {
                                Image(systemName: "cart")
                                    .imageScale(.large)
                                    .font(.system(size: 25))
                                    .padding(.horizontal)
                                    .frame(width: 45, height: 80)
                                    .overlay(RoundedRectangle(cornerRadius: 120).stroke(Color.green, lineWidth: 270).opacity(0.3))
                                
                            }.onDrop(of: [UTType.text], isTargeted:nil){ providers in
                                if let provider = providers.first{
                                    provider.loadObject(ofClass: NSString.self){ (object, error) in
                                        if let idString = object as? String, let uuid = UUID(uuidString: idString){
                                            if let product = productList.first(where: {$0.id == uuid}){
                                                DispatchQueue.main.async{
                                                    cartManager.addToCart(product:product)
                                                }
                                            }
                                        }
                                        
                                    }
                                    return true
                                }
                                return false
                            }
                            
                        }
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
                                    
                                }
                                
                            }
                        }
                        Text("Hola! \(user.getUser() ?? "Invitado")")
                            }
                            .padding(12)
                    
                    
                        
                        
                        CategoryListView(selectedCategory: $selectedCategory)
                            .environment(cartManager)
                            
                        
                        HStack {
                            Text("Explore **\(selectedCategory)** shoes").font(.system(size: 24))
                            Spacer()
                            if !selectedCategory.isEmpty {
                                NavigationLink {
                                    CardSmallProduct(selectedCategory: $selectedCategory)
                                        .environment(cartManager)
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

