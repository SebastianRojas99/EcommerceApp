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
    @State private var isActive: Bool = false
    
    
    var body: some View {
         
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack {
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
                
                VStack {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(product.size, id: \.self) { size in
                            Button {
                                product.selectedSize = size
                            } label: {
                                Text("\(size)")
                                    .font(.title2)
                                    .foregroundStyle(.black)
                                    .padding(.all)
                                    .background(product.selectedSize == size ? product.category.color.opacity(0.7) : Color.green.opacity(0.4))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                
                Button(action: {
                    
                    cartManager.addToCart(product: product)
                }) {
                    Text("Add To Cart")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(product.selectedSize != 0 ? Color.green.opacity(0.7) : Color.gray)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .disabled(product.selectedSize == 0)
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
