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
    @State private var isActive:Bool = false
    @State private var selectSize:Int? = nil
    
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
                                selectSize = size
                            } label: {
                                Text("\(size)")
                                    .font(.title2)
                                    .foregroundStyle(.black)
                                    .padding(.all)
                                    .background(selectSize == size ? product.category.color.opacity(0.7) : Color.green.opacity(0.4))
                                    .clipShape(Capsule())
                            }
                        }
                    })
                }
                
                Button(action: {
                    if let selectedSize = selectSize {
                                            var updatedProduct = product
                                            updatedProduct.selectedSize = selectedSize
                        cartManager.addToCart(product: updatedProduct, selectedSize: selectSize ?? 0)
                                            self.product = updatedProduct
                                            self.selectSize = nil
                                        }
                    
                }) {
                    Text("Add To Cart")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectSize != nil ? Color.green.opacity(0.7) : Color.gray)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .disabled(selectSize == nil)
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
