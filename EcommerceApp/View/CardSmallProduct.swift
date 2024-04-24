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
                                                .padding(.top, 5)
                                            
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
                                        
                                    }.frame(width: 170, height: 215)
                                    
                                }.font(.system(size: 30))
                                    .padding(.horizontal, 12)
                                    .padding()
                                    .frame(width: 170, height: 215)
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

/*
 import SwiftUI

 struct CardSmallProduct: View {
     @State var viewModel = ProductViewModel(productList: productList)
     @Binding var selectedCategory: String
     
     var body: some View {
         ScrollView {
             LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], content: {
                 ForEach(viewModel.productList) { item in
                     if item.category.title == selectedCategory || selectedCategory == "All" {
                         ZStack {
                             // Contenido de tu tarjeta
                             Image(item.image)
                                 .resizable()
                                 .scaledToFit()
                                 .frame(maxWidth: .infinity, maxHeight: .infinity) // Ajusta el tamaño de la imagen
                                 .padding(.trailing, -65)
                                 .clipped()
                             
                             VStack(alignment: .leading) {
                                 Text("**\(item.name)**")
                                     .padding(.top, 5)
                                 
                                 Text(item.category.title)
                                     .font(.callout)
                                     .padding()
                                     .background(Color.white.opacity(0.7))
                                     .clipShape(Capsule())
                                 
                                 Spacer()
                                 
                                 HStack {
                                     Text("\(item.price)").padding()
                                     Spacer()
                                     Button(action: {
                                         print("Adding item to cart...")
                                     }) {
                                         Image(systemName: "cart")
                                             .zIndex(1)
                                     }
                                     .imageScale(.medium)
                                     .frame(width: 90, height: 68)
                                     .background(Color.black)
                                     .clipShape(Capsule())
                                     .foregroundColor(.white)
                                 }
                                 .padding(.leading)
                                 .padding()
                                 .frame(height: 80)
                                 .background(Color.white.opacity(0.7))
                                 .clipShape(RoundedRectangle(cornerRadius: 35))
                             }
                             .frame(width: 170, height: 215)
                         }
                         .frame(maxWidth: .infinity, maxHeight: .infinity) // Ajusta el tamaño de la tarjeta
                         .background(Color.white) // Agrega un fondo blanco a cada tarjeta
                         .cornerRadius(25) // Ajusta la esquina de cada tarjeta
                         .shadow(radius: 5) // Agrega sombra a cada tarjeta
                     }
                 }
             })
             .padding() // Agrega un poco de espacio alrededor del LazyVGrid
         }
     }
 }

 */
