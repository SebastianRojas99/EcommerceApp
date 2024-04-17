//
//  CategoryModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import Foundation

struct CategoryModel: Hashable,Identifiable{
    var id: UUID = .init()
    var icon:String
    var title:String
}

var categoryList:[CategoryModel] = []
