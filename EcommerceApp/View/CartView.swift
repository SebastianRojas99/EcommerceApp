//
//  CartView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 25/04/2024.
//

import SwiftUI

struct CartView: View {
     //@State var product = ProductViewModel(productList: productList)
    var body: some View {
        
        NavigationStack{
            ScrollView(showsIndicators:false){
                VStack(alignment: .center,spacing: 20){
                    HStack{
                        Text("Cart").font(.largeTitle)
                        Spacer()
                        //buttons
                        Button{
                            
                        }label: {
                            Text("3")
                                .padding()
                                .frame(width: 70,height: 90)
                                .background(.green.opacity(0.4))
                                .clipShape(Capsule())
                        }
                        DismissButton()
                        
                        
                    }
                    VStack(spacing:20){
                        ForEach(productList){item in
                            CartToCard(product: item)
                            
                        }
                        
                    }.padding(.horizontal)
                    
                    VStack(alignment:.leading){
                        HStack{
                            Text("Delivery amount")
                            Spacer()
                            Text("$4.00")
                                .font(.system(size: 24,weight: .semibold))
                        }
                        
                        
                        Divider()
                        Text("Total amount")
                            .font(.system(size: 24,weight: .semibold))
                        Text("$38.00")
                            .font(.system(size: 36,weight: .bold))
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.green.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 30))
                    .padding()
                   
                    Button{
                        //
                    }label: {
                        Text("Make payment")
                    }
                }
            }
        }.navigationBarBackButtonHidden()
            .padding()
    }
}

