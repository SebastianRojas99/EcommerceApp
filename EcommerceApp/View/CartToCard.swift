//
//  CartToCard.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 25/04/2024.
//

import SwiftUI

struct CartToCard: View {
    @State var product:ProductModel
    @Environment(CartvViewModel.self) private var cartManager
    var body: some View {
        HStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width:80 ,height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle()) 
            VStack(alignment:.leading,content:{
                Text("\(product.name)")
                    .font(.headline)
                Text("\(product.category.title)")
                    .font(.callout)
            })
            Spacer()
            Text("\(product.price)")
                .padding()
                .background(.green.opacity(0.4))
                .clipShape(Capsule())
            
        }
    }
}


