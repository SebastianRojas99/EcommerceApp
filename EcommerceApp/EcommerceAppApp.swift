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
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(cartManager)
                .background(ignoresSafeAreaEdges: .all)
                
        }
    }
}

