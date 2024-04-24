//
//  CategoryCollectionView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 21/04/2024.
//

import SwiftUI

struct CategoryCollectionView: View {
    
    var body: some View {
        NavigationStack{
            //MARK: TRY USE LAZYVGRID HERE.
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                
            })
        }.navigationTitle("Choose the best hype **Sneakers**").font(.largeTitle)
    }
}

#Preview {
    CategoryCollectionView()
}
