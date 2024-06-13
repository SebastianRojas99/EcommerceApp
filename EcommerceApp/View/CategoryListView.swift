//
//  CategoryListView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//

import SwiftUI


struct CategoryListView: View {
    @State var viewModel = CategoryViewModel(categoryList: categoryList)
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.categoryList) { item in
                    Button(action: {
                        selectedCategory = item.title
                    }) {
                        HStack {
                            if item.title != "All" {
                                Image(systemName: item.icon)
                                    .foregroundStyle(selectedCategory == item.title ? .brown : .black)
                                if selectedCategory == item.title {
                                    Text(item.title)
                                }
                            } else {
                                Text("All")
                            }
                        }
                        .padding()
                        .background(selectedCategory == item.title ? item.color.opacity(0.4) : .gray.opacity(0.3))
                        .foregroundStyle(.black)
                        .clipShape(Capsule())
                        .animation(.easeInOut, value: selectedCategory)
                    }
                }
            }
        }
        .padding(.horizontal, 12)
    }
}
