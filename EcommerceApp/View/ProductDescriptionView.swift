//
//  ProductDescriptionView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 04/06/2024.
//

import SwiftUI

struct ProductDescriptionView: View {
    @State var product: ProductModel
    @Environment(CartvViewModel.self) private var cartManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Imagen del producto
            
            VStack{
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Capsule())
                    .padding(.all)
            }
                
                    
                Divider()
            
            HStack {
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.black)
                
                Spacer()
                
                Text("$\(product.price)")
                    .font(.title)
                    .foregroundStyle(.green.opacity(0.7))
            }
        
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Description")
                    .font(.headline)
                
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            
            Button(action: {
                cartManager.addToCart(product: product)
            }) {
                Text("Add To Cart")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.4))
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            .foregroundStyle(.white)
            .padding(.bottom)
        }
        
        .padding()
        .navigationBarItems(leading: DismissButton().foregroundStyle(.black))
        .background(.white)
        
    }
}