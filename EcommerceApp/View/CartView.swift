//
//  CartView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 25/04/2024.
//

import SwiftUI

struct CartView: View {
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
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
                    ForEach(productList){item in
                        CartToCard(product: item)
                    }
                }
            }
        }.navigationBarBackButtonHidden()
            .padding()
    }
}

#Preview {
    CartView()
}
