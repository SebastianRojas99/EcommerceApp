//
//  CartvViewModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 26/04/2024.
//

import Foundation
import SwiftUI
import Observation

@Observable
class CartvViewModel{
    
    
    private(set) var total:Int = 0
    private(set) var products:[ProductModel] = []
    
    func addToCart(product:ProductModel){
        products.append(product)
        total += product.price
    }
    func removeToCart(product:ProductModel){
        products = products.filter{$0.id != product.id}
        total -= product.price
    }
    
}
