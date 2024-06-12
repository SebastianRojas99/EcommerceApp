//
//  ProductListView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//

import SwiftUI

struct ProductListView:View {
    
    @State var productList:[ProductModel]
    @Environment(CartvViewModel.self) private var cartManager
    @Binding var selectedCategory:String
    
    var body: some View {
        let product = selectedCategory == "All" ? productList.first { $0.category.title == "Basketball" } : productList.first { $0.category.title == selectedCategory }
        ZStack{
            
            if let product = product {
                HStack{
                    VStack(alignment:.leading){
                        Text(product.name)
                            .font(.largeTitle)
                            .frame(alignment: .leading)
                        Spacer()
                        Text(product.description)
                            .font(.callout)
                            .foregroundStyle(.gray)
                            .frame(alignment: .leading)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Button{
                            
                        }label: {
                            Text("Shop \(product.category.title) shoes")
                        }
                    }
                }
                    
                }
        }
    }
}
