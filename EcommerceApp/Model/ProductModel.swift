//
//  ProductModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import Foundation

struct ProductModel:Identifiable{
    var id: UUID = .init()
    var name:String
    var description:String
    var image:String
    var price:String
    var category:CategoryModel
}

var productList:[ProductModel] = [
    ProductModel(name: "Jordan 1 Lost and Found", description: "the original first jordan", image: "Jordan", price: "$300", category: categoryList[3]),
    ProductModel(name: "Adidas Predator", description: "A high-performance soccer cleat", image: "Predator",price: "$250", category: categoryList[1]),
    ProductModel(name: "Nike Air Max 90", description: "Classic Nike sneaker with Air cushioning.",image: "Airmax90", price: "$120", category: categoryList[3]),
       ProductModel(name: "Adidas Ultra Boost", description: "Comfortable and stylish running shoe.", image: "Ultra",price: "$180", category: categoryList[1]),
       ProductModel(name: "Jordan 4 Retro", description: "Retrospective design with premium materials.", image: "J4",price: "$200", category: categoryList[3]),
       ProductModel(name: "Adidas Stan Smith", description: "Classic tennis shoe with a minimalist design.", image: "Bape",price: "$80", category: categoryList[4]),
       ProductModel(name: "Reebok Club C 85", description: "Heritage tennis shoe with a timeless look.", image: "Reebok",price: "$75", category: categoryList[3]),
       ProductModel(name: "Puma RS-X", description: "Chunky sneaker with a futuristic design.", image: "Puma",price: "$110", category: categoryList[4])

]
