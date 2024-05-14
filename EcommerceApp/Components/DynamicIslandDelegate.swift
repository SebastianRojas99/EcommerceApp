//
//  DynamicIslandDelegate.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 11/05/2024.
//

import Foundation
import ActivityKit

final class DynamicIslandDelegate{
     func GetProductQuantity(quantity:[ProductModel]) throws -> String{
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {return ""}
         let initialState = DynamicIslandModel.ContentState(quantity: quantity)
         let futureDate:Date = .now + 3600
         let activityContent = ActivityContent(state: initialState , staleDate: futureDate)
        
         let attributes = DynamicIslandModel()
         do{
             let activity = try Activity.request(attributes: attributes, content: activityContent)
             return activity.id
             
         }catch{
             throw error
         }
    }
}

