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
    var price:String
    var category:CategoryModel
}

var productList:[ProductModel] = [
    ProductModel(name: "Jordan 1", description: "the original first jordan", price: "300", category: categoryList[3]),
    ProductModel(name: "Adidas Predator", description: "A high-performance soccer cleat", price: "$250", category: categoryList[1]),
    ProductModel(name: "Spalding Official Basketball", description: "The official ball used in professional leagues.", price: "$90", category: categoryList[2]),
    ProductModel(name: "Nike Air Max 90", description: "Classic Nike sneaker with Air cushioning.", price: "$120", category: categoryList[3]),
       ProductModel(name: "Adidas Ultra Boost", description: "Comfortable and stylish running shoe.", price: "$180", category: categoryList[1]),
       ProductModel(name: "Converse Chuck Taylor All Star", description: "Iconic canvas sneaker suitable for everyday wear.", price: "$55", category: categoryList[0]),
       ProductModel(name: "Jordan 4 Retro", description: "Retrospective design with premium materials.", price: "$200", category: categoryList[3]),
       ProductModel(name: "New Balance 990v5", description: "A durable and supportive sneaker for long-distance runs.", price: "$175", category: categoryList[3]),
       ProductModel(name: "Reebok Classic Leather", description: "Timeless design suitable for casual wear.", price: "$70", category: categoryList[2]),
       ProductModel(name: "Puma Suede Classic", description: "Classic suede sneaker with a retro look.", price: "$65", category: categoryList[4]),
       ProductModel(name: "Vans Old Skool", description: "Iconic skate shoe with a low-top silhouette.", price: "$60", category: categoryList[4]),
       ProductModel(name: "Asics Gel-Kayano 27", description: "High-performance running shoe with gel cushioning.", price: "$160", category: categoryList[3]),
       ProductModel(name: "Under Armour HOVR Phantom 2", description: "Lightweight and responsive running shoe.", price: "$150", category: categoryList[2]),
       ProductModel(name: "Salomon Speedcross 5", description: "Trail running shoe with aggressive grip.", price: "$130", category: categoryList[2]),
       ProductModel(name: "Brooks Ghost 13", description: "Neutral running shoe for a smooth ride.", price: "$130", category: categoryList[3]),
       ProductModel(name: "Mizuno Wave Rider 24", description: "Dynamic cushioning for a responsive run.", price: "$130", category: categoryList[1]),
       ProductModel(name: "Saucony Jazz Original", description: "Retro-inspired sneaker with nylon and suede upper.", price: "$60", category: categoryList[1]),
       ProductModel(name: "Hoka One One Bondi 7", description: "Maximum cushioning for a plush ride.", price: "$150", category: categoryList[2]),
       ProductModel(name: "Fila Disruptor II", description: "Chunky sneaker with a retro vibe.", price: "$65", category: categoryList[4]),
       ProductModel(name: "Nike Air Force 1", description: "Iconic basketball sneaker with timeless design.", price: "$90", category: categoryList[4]),
       ProductModel(name: "Adidas Stan Smith", description: "Classic tennis shoe with a minimalist design.", price: "$80", category: categoryList[4]),
       ProductModel(name: "Reebok Club C 85", description: "Heritage tennis shoe with a timeless look.", price: "$75", category: categoryList[3]),
       ProductModel(name: "Puma RS-X", description: "Chunky sneaker with a futuristic design.", price: "$110", category: categoryList[4])

]
