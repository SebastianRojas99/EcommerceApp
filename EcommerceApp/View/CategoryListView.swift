//
//  CategoryListView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//

import SwiftUI

struct CategoryListView:View{
    
    @State var viewModel = CategoryViewModel(categoryList: categoryList)
    @Binding var selectedCategory: String
    
    //MARK: DEBUG THAT!!
    //----------------------------------------------
   var body : some View {
       HStack{
           
           ScrollView(.horizontal,showsIndicators: false){
               HStack{
                   ForEach(viewModel.categoryList,id: \.self){ item in
                       Button{
                           selectedCategory = item.title
                       }label: {
                           HStack{
                               if item.title !=  "All"{
                                   Image(systemName: item.icon).foregroundStyle(selectedCategory == item.title ? .brown : .black)
                               }
                               Text(item.title)
                           }
                       }
                       .padding()
                       .background(selectedCategory == item.title ? .green.opacity(0.3) : .gray.opacity(0.2))
                       .foregroundStyle(.black)
                       .clipShape(.capsule)
                   }
               }
           }
       }.padding(.horizontal,12)
   }
}



/*
@State private var viewModel = CategoryViewModel(categoryList: categoryList) // Inject initial data

var body: some View {
    List {
        ForEach(viewModel.categoryList) { category in
            Text(category.title)
        }
    }
}
}
*/


