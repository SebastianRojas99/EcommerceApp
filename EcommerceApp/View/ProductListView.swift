//
//  ProductListView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//

import SwiftUI

struct ProductListView: View {
    
    @State var productList: [ProductModel]
    @Environment(CartvViewModel.self) private var cartManager
    @Binding var selectedCategory: String
    @State private var isActive = false
    
    var body: some View {
        let product = selectedCategory == "All" ? productList.first { $0.category.title == "Basketball" } : productList.first { $0.category.title == selectedCategory }
        ZStack {
            if let product = product {
                HStack {
                    ZStack{
                        VStack(alignment: .leading, spacing: 10) {
                            
                            
                            Text(product.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .lineLimit(2)
                            
                            Text(product.description)
                                .font(.callout)
                                .foregroundColor(.white)
                            
                            Button(action: {
                                isActive = true
                            }) {
                                Text("Shop now")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(.black)
                                    .cornerRadius(5)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                            }
                        }
                        .navigationDestination(
                            isPresented: $isActive,
                            destination:{
                                CardSmallProduct(selectedCategory: $selectedCategory)
                                    .navigationBarBackButtonHidden(true)
                                    .environment(cartManager)
                            })
                        .padding()
                    }
                    
                    
                    Spacer()
                    
                    VStack {
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                }
                .background(product.category.color)
                .cornerRadius(10)
                .padding(.horizontal)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                .overlay(
                    Image(product.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding(12),
                    alignment: .topTrailing
                )
            }
        }
    }
}
