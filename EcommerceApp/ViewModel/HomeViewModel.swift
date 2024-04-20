//
//  HomeViewModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 20/04/2024.
//

import Foundation
import SwiftUI
import Observation
class HomeViewModel: ObservableObject {

     var categoryViewModel: CategoryViewModel // ViewModel de categorías
     var productViewModel: ProductViewModel // ViewModel de productos
     var selectedCategory: String = "" // Categoría seleccionada

    init(categoryViewModel: CategoryViewModel, productViewModel: ProductViewModel) {
        self.categoryViewModel = categoryViewModel
        self.productViewModel = productViewModel
    }

}

