//
//  CategoryListView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import SwiftUI

struct CategoryListView: View {
    @State var selectedCategory = ""
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            Text("hello")
            Spacer()
        }.padding()
    }
}

#Preview {
    CategoryListView()
}
