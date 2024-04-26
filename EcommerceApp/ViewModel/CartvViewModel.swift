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
    
    
    var total:Int = 0
    
    func addToCart(){
        
    }
    
    init(total: Int) {
        self.total = total
    }
}
