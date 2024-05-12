//
//  DynamicIslandDelegate.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 11/05/2024.
//

import Foundation
import ActivityKit

final class DynamicIslandDelegate{
     func GetProductQuantity(quantity:[ProductModel]) throws -> Int{
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {return 0}
    }
}
