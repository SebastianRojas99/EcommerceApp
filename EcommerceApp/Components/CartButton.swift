//
//  CartButton.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 05/06/2024.
//

import SwiftUI
import UniformTypeIdentifiers

struct CartButton: View {
    @Environment(CartvViewModel.self) private var cartManager
    @State private var cartInProduct = myCart.count
    var body: some View {
        NavigationLink {
            CartView()
                .environment(cartManager)
        } label: {
            HStack {
                Image(systemName: "cart")
                    .imageScale(.large)
                        .font(.system(size: 25))
                        .padding(.horizontal)
                        .frame(width: 45, height: 80)
                        .foregroundStyle(.black)
                        .overlay{
                            CounterButton(value: $cartInProduct, foreground: .white, background: .green)
                        }.onChange(of: cartManager.products){
                            cartInProduct = cartManager.products.count
                        }
            }
        }
    }
}


