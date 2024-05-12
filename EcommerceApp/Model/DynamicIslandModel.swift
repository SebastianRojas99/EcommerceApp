//
//  DynamicIslandModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 12/05/2024.
//

import Foundation
import ActivityKit

struct DynamicIslandModel: ActivityAttributes{
    public struct ContentState:Codable, Hashable{
        var quantity:[ProductModel]
        
    }
}
