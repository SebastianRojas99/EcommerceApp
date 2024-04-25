//
//  CartToCard.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 25/04/2024.
//

import SwiftUI

struct CartToCard: View {
    @State var product:ProductModel
    var body: some View {
        VStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width:80 ,height: 40)
        }
    }
}


