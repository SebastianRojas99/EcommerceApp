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
    @State var selectedSize: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,spacing:0) {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(product.name)
                            .font(.system(size:25))
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("$\(product.price)")
                            .font(.title)
                            .foregroundColor(.green.opacity(0.7))
                    }
                    
                    Text("Description")
                        .font(.headline)
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Text("Select Size")
                        .font(.headline)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(product.size, id: \.self) { size in
                            Button {
                                selectedSize = size
                                product.selectedSize = size
                            } label: {
                                Text("\(size)")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(selectedSize == size ? product.category.color.opacity(0.7) : Color.gray.opacity(0.2))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    
                    Button(action: {
                        product.selectedSize = selectedSize
                        cartManager.changeSize(product: product, size: selectedSize)
                        cartManager.addToCart(product: product)
                        selectedSize = 0
                    }) {
                        Text("Add To Cart")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedSize != 0 ? Color.green.opacity(0.7) : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(selectedSize == 0)
                    .padding(.all)
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            //.padding() // Mover el padding aquí
        }
        .background(Color.gray.opacity(0.1).ignoresSafeArea()) // Extiende el fondo blanco a toda la pantalla
        .navigationBarItems(leading: DismissButton().zIndex(1).foregroundColor(.black)).background(Color.gray.opacity(0.1).ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}
