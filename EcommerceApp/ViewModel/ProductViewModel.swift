//
//  ProductViewModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//

import Foundation
import SwiftUI
import Observation

@Observable
class ProductViewModel{
    
    var draggedProduct: ProductModel?
    var productList:[ProductModel]
    
    init(productList: [ProductModel]) {
        self.productList = productList
    }
    
}
