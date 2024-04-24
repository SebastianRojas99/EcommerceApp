//
//  CardSmallProduct.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 23/04/2024.
//

import SwiftUI

struct CardSmallProduct: View {
    @State var viewModel = ProductViewModel(productList: productList)
    @Binding var selectedCategory: String
    var body: some View {
        ScrollView{
            
            
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 20, content: {
                ForEach(viewModel.productList) { item in
                    if item.category.title == selectedCategory || selectedCategory == "All" {
                        
                            
                        ZStack{
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 500) // Límite de tamaño máximo
                                        .frame(maxHeight:500)
                                        .padding(.trailing, -65)
                                        .clipped()
                                    
                                    VStack{
                                        VStack(alignment:.leading){
                                            Text("**\(item.name)**")
                                                .font(.system(size: 14))
                                                .padding()
                                            
                                            Text(item.category.title)
                                                .font(.callout)
                                                .padding()
                                                .background(.white.opacity(0.7))
                                                .clipShape(Capsule())
                                            
                                            Spacer()
                                            
                                            
                                            
                                            HStack {
                                                Text("\(item.price)").padding()
                                                Spacer()
                                                Button {
                                                    print("Adding item to cart...")
                                                } label: {
                                                    Image(systemName: "cart")
                                                        .zIndex(1)
                                                    
                                                    
                                                }.imageScale(.small)
                                                    .frame(width: 90, height: 68)
                                                    .background(.black)
                                                    .clipShape(Capsule())
                                                    .foregroundStyle(.white)
                                                
                                                
                                                
                                                
                                            }
                                            .padding(.leading)
                                            .padding()
                                            .frame(height: 80)
                                            .background(Color.white.opacity(0.7))
                                            .clipShape(RoundedRectangle(cornerRadius: 35))
                                        }
                                        
                                    }.frame(width: 180, height: 250)
                                    
                                }.font(.system(size: 30))
                                    .padding(.horizontal, 12)
                                    .padding()
                                    .frame(width: 180, height: 250)
                                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(item.category.color, lineWidth: 1))
                                    .background(item.category.color.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .clipped()
                                
                                
                                
                            
                        }

                }
            })
        }

    }
}

