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
    @State private var isExpanded: Bool = false
    
    
   var body : some View {
       HStack{
           ScrollView(.horizontal,showsIndicators: false){
               HStack{
                   ForEach(viewModel.categoryList,id: \.self){ item in
                       Button{
                           selectedCategory = item.title
                           isExpanded = true
                          
                       }label: {
                           if !isExpanded{
                               HStack{
                                   if item.title !=  "All"{
                                       Image(systemName: item.icon).foregroundStyle(selectedCategory == item.title ? .brown : .black)
                                   }else{
                                       Text("All")
                                   }
                               }
                               }else{
                                   HStack{
                                       if item.title !=  "All"{
                                           Image(systemName: item.icon).foregroundStyle(selectedCategory == item.title ? .brown : .black)
                                       }
                                       Text(item.title)
                                   }
                               }
                           
                           
                       }
                       .padding()
                       .background(selectedCategory == item.title ? item.color.opacity(0.4) : .gray.opacity(0.3))
                       .foregroundStyle(.black)
                       .clipShape(.capsule)
                   }
               }
           }
       }.padding(.horizontal,12)
   }
}

