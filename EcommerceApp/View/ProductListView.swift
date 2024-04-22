//
//  ProductListView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//
import SwiftUI

struct ProductListView: View {
    @State var viewModel = ProductViewModel(productList: productList)
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(viewModel.productList) { item in
                    if item.category.title == selectedCategory || selectedCategory == "All" {
                        VStack{
                            ZStack {
                                
                                VStack(alignment:.leading){
                                    Text("**\(item.name)**")
                                        .padding(.top, 5)
                                    VStack{
                                        Text(item.category.title)
                                            .font(.callout)
                                            .padding()
                                            .background(.white.opacity(0.7))
                                            .clipShape(Capsule())
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Text("\(item.price)").padding()
                                        Spacer()
                                        //MARK: BOTON NO ANDA!
                                        Button{
                                            print("Adding item to cart...")
                                        }label:{
                                            Image(systemName: "cart")
                                                .imageScale(.medium)
                                                .frame(width: 90, height: 68)
                                                .background(.black)
                                                .clipShape(Capsule())
                                                .foregroundStyle(.white)
                                        }
                                    }
                                    .padding(.leading)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 80)
                                    .background(Color.white.opacity(0.7))
                                    .clipShape(RoundedRectangle(cornerRadius: 35))
                                    
                                }
                                .font(.system(size: 30))
                                .padding(.horizontal, 12)
                                .padding()
                                .frame(width: 346, height: 422)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(item.category.color, lineWidth: 1))
                                .background(item.category.color.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                
                                Image(item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 380) // Límite de tamaño máximo
                                    .padding(.trailing, -85)
                                    .clipped(antialiased: true) // Asegura que la imagen no se escape del contenedor
                            }
                            .clipped() // Aquí aplicamos el efecto de "overflow: hidden"
                        }
                    }
                }
                .padding(20)
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 12)
    }
}
