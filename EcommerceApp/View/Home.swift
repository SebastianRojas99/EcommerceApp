//
//  Home.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//
import SwiftUI

struct Home: View {
    @State private var categoryViewModel = CategoryViewModel(categoryList: categoryList)
    @State private var productViewModel = ProductViewModel(productList: productList)
    @State private var selectedCategory = ""
    @Environment(CartvViewModel.self) private var cartManager
    @State private var product: ProductModel!
    @State private var cartInProduct = myCart
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("**SneakerHub** Place")
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
                                    .foregroundStyle(.secondary)
                            }
                            .onDrop(of: [.text], delegate: DropViewDelegate(destinationItem: nil, products: $cartInProduct, draggedItem: $product, cartManager: cartManager))
                        }
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .font(.system(size: 25))
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 200).stroke(Color.green, lineWidth: 270).opacity(0.4))
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
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                            }
                        }
                    }
                    Spacer()

                    ProductListView(selectedCategory: $selectedCategory)
                        .environment(cartManager)
                        .padding(.top, 30)
                }
            }
        }
        .background(Color.white)
    }
}
