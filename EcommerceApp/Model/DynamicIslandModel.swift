//
//  DynamicIslandModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 12/05/2024.
//

import Foundation
import ActivityKit

//MARK: SEE THAT

struct DynamicIslandModel: ActivityAttributes{
    public struct ContentState:Codable, Hashable{
        var quantity:[ProductModel]
        
    }
}
