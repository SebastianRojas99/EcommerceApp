//
//  CategoryModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import Foundation

struct CategoryModel:Identifiable, Hashable{
    var id: UUID = .init()
    var icon:String
    var title:String
    
}

var categoryList:[CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "figure.run", title: "Running"),
    CategoryModel(icon: "basketball", title: "Basketball"),
    CategoryModel(icon: "figure", title: "StreetWear"),
]
