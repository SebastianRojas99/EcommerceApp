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
  @Environment(CartvViewModel.self) private var cart

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          // Header
          HStack {
            Text("Shop your favorite **Sneakers**")
              .font(.system(size: 32))
              .padding(.trailing)
            Spacer()
              NavigationLink{
                  CartView()
                      .environment(cart)
              }label: {
                  HStack{
                      Image(systemName: "cart")
                          .imageScale(.large)
                          .foregroundStyle(.secondary) 
                  }
              }
            Image(systemName: "line.3.horizontal")
              .imageScale(.large)
              .font(.system(size: 25))
              .padding()
              .frame(width: 70, height: 90)
              .overlay(RoundedRectangle(cornerRadius: 200).stroke(.green, lineWidth: 270).opacity(0.4))
          }
          .padding(12)

          // Categories
          CategoryListView(selectedCategory: $selectedCategory)

          // Use NavigationLink for category selection
            HStack{
                Text("Explore **\(selectedCategory)** shoes").font(.system(size: 24))
                Spacer()
                if !selectedCategory.isEmpty {
                  NavigationLink {
                      CardSmallProduct(selectedCategory: $selectedCategory)
                          .environment(cart)
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

          // Product list (unchanged)
          ProductListView(selectedCategory: $selectedCategory)
        }
      }
    }.background(.white)
  }
}






