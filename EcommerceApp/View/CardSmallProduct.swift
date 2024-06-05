//
//  CardSmallProduct.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 23/04/2024.
//

import SwiftUI
import UniformTypeIdentifiers


struct CardSmallProduct: View {
    @State var viewModel = ProductViewModel(productList: productList)
    @Binding var selectedCategory: String
    @Environment(CartvViewModel.self) private var cartManager
    @State var product: ProductModel!
    var body: some View {
        NavigationStack{
            HStack{
                Spacer()
                HStack{
                    Text("Cart").font(.largeTitle)
                    Spacer()
                    CartButton().padding(.horizontal)
                    DismissButton()
                    }
                }
                .padding()
            }.navigationTitle("\(selectedCategory) shoes ").font(.largeTitle)
            .background(.white)
            .foregroundStyle(.black)
        
        
            ScrollView(.vertical,showsIndicators: false){
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 20, content: {
                    ForEach(viewModel.productList) { item in
                        if item.category.title == selectedCategory || selectedCategory == "All" {
                            
                                
                            ZStack{
                                NavigationLink{
                                    ProductDescriptionView(product: item).navigationBarBackButtonHidden(true)
                                        .environment(cartManager)
                                    
                                }label: {
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 500, maxHeight: 500)
                                        .padding(.trailing, -65)
                                        .clipped()
                                }
                                        
                                        VStack(alignment:.leading){
                                            VStack(alignment:.leading){
                                                Text("**\(item.name)**")
                                                    .font(.system(size: 16))
                                                    .padding(.top)
                                                    .font(.largeTitle)
                                                
                                                Text(item.category.title)
                                                    .font(.callout)
                                                    .padding(10)
                                                    .background(.white.opacity(0.7))
                                                    .clipShape(Capsule())
                                            }.padding(.horizontal,10)
                                                
                                                Spacer()
                                                
                                                
                                                
                                                HStack {
                                                    Text("$\(item.price)")
                                                        .font(.system(size:18))
                                                        
                                                    Spacer()
                                                    Button {
                                                        cartManager.addToCart(product: item)
                                                        print("Adding item to cart...")
                                                    } label: {
                                                        Image(systemName: "cart")
                                                            .zIndex(1)
                                                        
                                                        
                                                    }.imageScale(.small)
                                                        .frame(width: 50, height: 40)
                                                        .background(.black)
                                                        .clipShape(Capsule())
                                                        .foregroundStyle(.white)
                                                        
                                                    
                                                    
                                                    
                                                    
                                                }
                                                .padding(.leading)
                                                .padding()
                                                .frame(height: 55)
                                                .background(Color.white.opacity(0.7))
                                                .clipShape(RoundedRectangle(cornerRadius: 35))
                                            
                                            
                                        }.frame(width: 180, height: 250)
                                    
                                        
                                    }.font(.system(size: 30))
                                        .padding(.horizontal, 12)
                                        .padding(.bottom,10)
                                        .frame(width: 180, height: 250)
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(item.category.color, lineWidth: 0))
                                        .background(item.category.color.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                        .clipped()
                                        .onDrag {
                                            self.product = item
                                            return NSItemProvider(object: item.id.uuidString as NSString)
                                        }
                                    
                                    
                                    
                                
                            }

                    }
                })
            }
            

        }
}

