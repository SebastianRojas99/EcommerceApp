//
//  CartView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 25/04/2024.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        Text("Cart").font(.largeTitle)
                        Spacer()
                        //buttons
                        Button{
                            dismiss()
                        }label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                        }
                        
                    }
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    CartView()
}
