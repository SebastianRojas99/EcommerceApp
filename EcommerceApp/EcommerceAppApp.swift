//
//  EcommerceAppApp.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import SwiftUI

@main
struct EcommerceAppApp: App {
    @State var cartManager = CartvViewModel()
    @State var productManager = ProductViewModel(productList: productList)
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(cartManager)
                .environment(productManager)
                .background(ignoresSafeAreaEdges: .all)
                
        }
    }
}
