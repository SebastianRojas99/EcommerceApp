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
    
    var productList:[ProductModel]
    

    init(productList: [ProductModel]) {
        self.productList = productList
    }
    
    func changeSize(product:UUID,size:Int){
        if let index = productList.firstIndex(where: { $0.id == product }) {
            productList[index].selectedSize = size
        }
    }
    
    
}

