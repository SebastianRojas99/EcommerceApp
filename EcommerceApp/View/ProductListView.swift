//
//  ProductListView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//

import SwiftUI
struct ProductListView: View {
    @State var product: ProductModel!
    @State private var cartInProduct = myCart
    @State private var productVM = ProductViewModel(productList: productList)
    @Binding var selectedCategory: String
    @Environment(CartvViewModel.self) private var cartManager
    let productQuantity = 3
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 18) {
                ForEach(productVM.productList.prefix(productQuantity)) { item in
                    if selectedCategory == "All" || item.category.title == selectedCategory {
                        ZStack {
                            ZStack {
                                
                                VStack{
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
                                }.padding(.top,100)
                                
                                VStack {
                                    Spacer()
                                    VStack(alignment: .leading) {
                                        Text("**\(item.name)**")
                                            .padding(.top, 5)
                                        
                                        Text(item.category.title)
                                            .font(.callout)
                                            .padding()
                                            .background(Color.white.opacity(0.7))
                                            .clipShape(Capsule())
                                        
                                        Spacer()
                                    }
                                }.padding(.bottom,50)
                            }
                            .font(.system(size: 30))
                            .padding(.horizontal, 12)
                            .padding()
                            .frame(width: 360, height: 450)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(item.category.color, lineWidth: 1))
                            .background(item.category.color.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        }
                        .clipped()
                        .onDrag {
                            self.product = item
                            return NSItemProvider(object: item.id.uuidString as NSString)
                        }
                        
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
