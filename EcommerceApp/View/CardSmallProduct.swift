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
    @Environment(CartvViewModel.self) private var cartManager
    @State var product: ProductModel!
    var body: some View {
        NavigationStack{
            HStack{
                Spacer()
                HStack{
                    Text("Cart").font(.largeTitle)
                    Spacer()
                    CartButton().padding(.horizontal).background(.white)
                    DismissButton()
                }.background(.white)
                }
                .padding()
                .background(.white)
            }.navigationTitle("\(selectedCategory) shoes ")
            .font(.largeTitle)
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
                                        .scaledToFill()
                                        .frame(maxWidth: 500, maxHeight: 500)
                                        .padding(.trailing, -65)
                                        .clipped()
                                        .padding(.top,50)
                                }
                                        
                                        VStack(alignment:.leading){
                                            VStack(alignment:.leading){
                                                Text("**\(item.name)**")
                                                    .font(.system(size: 16))
                                                    .padding(.top)
                                                    .font(.largeTitle)
                                                    .frame(alignment:.leading)
                                                    .foregroundStyle(.white)
                                                    .lineLimit(1)
                                                    
                                                
                                                Text(item.category.title)
                                                    .font(.callout)
                                                    .padding(10)
                                                    .background(.white.opacity(0.7))
                                                    .clipShape(Capsule())
                                            }.padding(.horizontal,10)
                                                .frame(alignment:.leading)
                                                
                                                Spacer()
                                                
                                        }.frame(width: 180, height: 220).foregroundStyle(.black)
                                    
                                        
                                    }.font(.system(size: 30))
                                        .padding(.horizontal, 12)
                                        .padding(.bottom,10)
                                        .frame(width: 180, height: 220)
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(item.category.color, lineWidth: 0))
                                        .background(selectedCategory == "All" ? .green : item.category.color)
                                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                        .clipped()
                            
                        }

                    }
                })
            }.background(.white)
            

    }
}

