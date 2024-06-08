//
//  ProductDescriptionView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 04/06/2024.
//

import SwiftUI

struct ProductDescriptionView: View {
    @State var product: ProductModel
    @State private var selectedSize: Int? = nil
    @Environment(CartvViewModel.self) private var cartManager
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 16) {
                // Imagen del producto
                
                VStack{
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
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
                
                VStack{
                    
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())],spacing: 20, content: {
                        ForEach(product.size, id: \.self) { size in
                            Button {
                                if selectedSize == size {
                                    selectedSize = nil
                                } else {
                                    selectedSize = size
                                }
                            } label: {
                                Text("\(size)")
                                    .font(.title2)
                                    .foregroundStyle(.black)
                                    .padding(.all)
                                    .background(selectedSize == size ? product.category.color.opacity(0.7) : Color.green.opacity(0.4))
                                    .clipShape(Capsule())
                            }
                        }
                    })
                }
                
                Button(action: {
                    if selectedSize != nil {
                        cartManager.addToCart(product: product)
                    }
                }) {
                    Text("Add To Cart")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectedSize != nil ? Color.green.opacity(0.4) : Color.gray)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .foregroundStyle(.white)
                .padding(.bottom)
            }
        }
        .statusBarHidden(true)
        .padding()
        .navigationBarItems(leading: DismissButton().foregroundStyle(.black))
        .background(Color.white)
    }
}
