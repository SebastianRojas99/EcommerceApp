//
//  ProductModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import Foundation

struct ProductModel:Codable,Identifiable,Hashable{
    var id: UUID = .init()
    var name:String
    var description:String
    var image:String
    var logo:String
    var price:Int
    var size:[Int]
    var category:CategoryModel
    var selectedSize:Int = 0
}



var productList:[ProductModel] = [
    ProductModel(name: "Jordan 1 Lost and Found", description: "the original first jordan", image: "Jordan", logo: "nikeLogo", price: 300, size: [40,41,42,43], category: categoryList[2]),
    ProductModel(name: "Adidas Ultra Boost", description: "Comfortable and stylish running shoe.", image: "Ultra",logo: "adidasLogo",price: 180, size: [40,41,42,43],category: categoryList[1]),
    ProductModel(name: "Adidas Predator", description: "A high-performance soccer cleat", image: "Predator",logo: "adidasLogo", price: 250, size: [40,41,42,43], category: categoryList[1]),
    ProductModel(name: "Nike Air Max 90", description: "Classic Nike sneaker with Air cushioning.",image: "Airmax90",logo: "nikeLogo", price: 120,size: [40,41,42,43], category: categoryList[2]),
       
       ProductModel(name: "Jordan 4 Retro", description: "Retrospective design with premium materials.", image: "J4",logo: "nikeLogo",price: 200, size: [40,41,42,43],category: categoryList[2]),
       ProductModel(name: "Adidas Stan Smith", description: "Classic tennis shoe with a minimalist design.", image: "Bape",logo: "bapeLogo",price: 80,size: [40,41,42,43], category: categoryList[3]),
       ProductModel(name: "Reebok Club C 85", description: "Heritage tennis shoe with a timeless look.", image: "Reebok",logo: "reebokLogo",price: 75, size: [40,41,42,43],category: categoryList[2]),
       ProductModel(name: "Puma RS-X", description: "Chunky sneaker with a futuristic design.", image: "Puma",logo: "pumaLogo",price: 110, size: [40,41,42,43],category: categoryList[3])

]
