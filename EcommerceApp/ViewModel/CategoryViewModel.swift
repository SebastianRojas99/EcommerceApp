//
//  CategoryViewModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 19/04/2024.
//

import Foundation
import SwiftUI
import Observation

@Observable
class CategoryViewModel{
    
    var categoryList:[CategoryModel]
    var selectedCategory:String
    init(categoryList: [CategoryModel],selectedCategory:String = "") {
        self.categoryList = categoryList
        self.selectedCategory = selectedCategory
    }

}
