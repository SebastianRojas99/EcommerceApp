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

        
    var body: some View {
        
        ScrollView{
            
            VStack{
                //how to create a header
                
                HStack{
                    Text("Shop your favorite **Sneakers**👟")
                        .font(.system(size: 32))
                        .padding(.trailing)
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                        .font(.system(size: 25))
                        .padding()
                        .frame(width: 70,height: 90)
                        .overlay(RoundedRectangle(cornerRadius: 200).stroke(.green,lineWidth: 270).opacity(0.4))
                    
                    
                }.padding(12)
                //Categories
                CategoryListView(selectedCategory:$selectedCategory)
                
                //Collection
                
                HStack{
                    
                    Text("**\(selectedCategory)** shoes").font(.system(size: 24))
                    Spacer()
                    Image(systemName: "arrow.right").imageScale(.large)
                }.padding(.horizontal,12)
                    .padding(.vertical,6)
                //Product
                ProductListView(selectedCategory: $selectedCategory)
            }
        }//vistas
        
    }
}




#Preview {
    Home()
}
