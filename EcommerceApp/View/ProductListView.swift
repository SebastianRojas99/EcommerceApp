//
//  ProductListView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//

import SwiftUI

    struct ProductListView: View {
        @State private var viewModel = ProductViewModel(productList: productList)
        @State var selectedCategory = ""
        var body:some View{
            ScrollView(.horizontal,showsIndicators: false){
                ZStack{
                    HStack(alignment:.center){
                        ForEach(viewModel.productList){ item in
                            if item.category.title == selectedCategory || selectedCategory == "All" {
                                ZStack{
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFit()
                                    VStack{
                                        
                                        Text("**\(item.name)**").padding(.top,5)
                                        Text(item.category.title)
                                            .font(.callout)
                                            .padding()
                                            .clipShape(Capsule())
                                            .background(.white.opacity(0.13))
                                        
                                            
                                        
                                        Spacer()
                                        
                                        HStack{
                                            Text("\(item.price)").padding()
                                            Spacer()
                                            Button{
                                                //
                                            }label: {
                                                Image(systemName: "cart")
                                                    .imageScale(.medium)
                                                    .foregroundStyle(.white)
                                                    .background(.black)
                                                    .clipShape(Capsule())
                                                    .frame(width:90 ,height:68)
                                            }
                                            
                                        }.padding(.leading)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 80)
                                            .background(Color.gray.opacity(0.2))
                                            .clipShape(RoundedRectangle(cornerRadius: 35))
                                        
                                        
                                    }.font(.system(size: 30))
                                        .padding(.horizontal,12)
                                        .padding()
                                        .frame(width: 336,height: 422)
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.green,lineWidth: 1))
                                        .background(.green.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                }
                        
                                
                                
                            }
                        }.padding(20)
                    }
                }
         
            }.padding(.top,50)
                .padding(.horizontal,12)
        }
    }



#Preview {
    ProductListView()
}
