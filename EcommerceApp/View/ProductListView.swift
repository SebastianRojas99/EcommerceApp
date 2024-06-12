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
        
        if let product = product {
            ZStack {
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(product.name)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Text(product.description)
                            .font(.callout)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        
                      
                        NavigationLink{
                            CardSmallProduct(selectedCategory: $selectedCategory).environment(cartManager)
                                .navigationBarBackButtonHidden(true)
                        }label: {
                            
                                Text("Shop now")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 20)
                                    .background(.black)
                                    .cornerRadius(10)                            
                        }
                    }

                    .padding()
                    
                    Spacer()
                    
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        Image(product.logo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .padding(12)
                    }
                    Spacer()
                }
            }
            .background(product.category.color)
            .cornerRadius(15)
            .padding(.horizontal)
            .shadow(color: .gray, radius: 5, x: 0, y: 5)
        }
    }
}
