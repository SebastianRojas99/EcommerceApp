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
    func changeSize(product: ProductModel, size: Int) {
        if let index = productList.firstIndex(where: { $0.id == product.id }) {
                productList[index].selectedSize = size
            }
        }
    
    func removeToCart(product: ProductModel) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            total -= products[index].price
            products.remove(at: index)
        }
    }
    
    func clearAllCart(){
        products = []
        total = 0
    }
    
    
}
