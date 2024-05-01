//
//  User.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 01/05/2024.
//

import Foundation


struct User:Identifiable{
    var id: UUID = .init()
    var username:String
    var password:String
    
}


let exampleUser:User = User(username: "seba", password: "123")

