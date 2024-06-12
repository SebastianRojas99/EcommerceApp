//
//  HomeButton.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 12/06/2024.
//

import SwiftUI

struct HomeButton: View {
    @Environment(CartvViewModel.self) private var cartManager
    var body: some View {
        VStack{
            NavigationLink{
                ContentView()
                    .environment(cartManager)
                    .navigationBarBackButtonHidden(true)
                    
            }label: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .padding()
                    .frame(width: 70,height: 90)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    .foregroundStyle(.black)
            }
        }
        
    }
}

