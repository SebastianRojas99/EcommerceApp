//
//  ProductModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import Foundation

struct ProductModel:Identifiable,Hashable{
    var id: UUID = .init()
    var name:String
    var description:String
    var price:String
}

struct ProductResults{
    var results:[ProductModel] = []
}
