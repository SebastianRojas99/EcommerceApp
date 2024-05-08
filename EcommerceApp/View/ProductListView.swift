//
//  ProductListView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//
import SwiftUI

struct ProductListView: View {
  @State  var product:ProductModel!
  @State var viewModel = ProductViewModel(productList: productList)
  @Binding var selectedCategory: String
  @Environment(CartvViewModel.self) private var cart
   let productQuantity = 3
    var body: some View {
        Spacer()
        ScrollView(.horizontal,showsIndicators:false){
            HStack(alignment:.center,spacing:18){
                ForEach(viewModel.productList.prefix(productQuantity)) { item in
                    if selectedCategory == "All" || item.category.title == selectedCategory{
                        ZStack{
                            ZStack{
                                Image(item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 500) 
                                    .frame(maxHeight:500)
                                    .padding(.trailing, -65)
                                    .clipped()
                                VStack{
                                    VStack(alignment:.leading){
                                        Text("**\(item.name)**")
                                            .padding(.top, 5)
                                        
                                        Text(item.category.title)
                                            .font(.callout)
                                            .padding()
                                            .background(.white.opacity(0.7))
                                            .clipShape(Capsule())
                                        
                                        Spacer()
                                        
                                        
                                        HStack {
                                            Text("$\(item.price)").padding()
                                            Spacer()
                                            Button {
                                                cart.addToCart(product:item)
                                                print("Adding item to cart...")
                                            } label: {
                                                Image(systemName: "cart")
                                                    .zIndex(1)
                                                
                                                
                                            }.imageScale(.medium)
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
                                    
                                }
                                
                            }.font(.system(size: 30))
                                .padding(.horizontal, 12)
                                .padding()
                                .frame(width: 360, height: 450)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(item.category.color, lineWidth: 1))
                                .background(item.category.color.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            
                            
                            
                        }.clipped()
                            .onDrag({
                                self.product = item
                                return NSItemProvider()
                            })
                        
                            
                    }
                }
            }.padding(.horizontal)
        }
    }
}
