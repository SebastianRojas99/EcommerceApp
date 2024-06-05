//
//  ColorUtils.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 05/06/2024.
//

import Foundation
import SwiftUI

extension CategoryModel{
    var color:Color{
        switch title{
        case "All":
            return .green
        case "Basketball":
            return .red
            
        case "StreetWear":
            return .indigo
            
        case "Running":
            return .blue
            
        default:
            return .green
        }
        
    }
}
