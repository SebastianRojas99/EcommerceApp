//
//  UserViewModel.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 01/05/2024.
//

import Foundation
import SwiftUI
import Observation

@Observable
class UserViewModel{
    
    var username:String = "seba"
    var password:String = "123"
    var hasError = false
    var errorMessage: String? = nil
    
    
    func validation(_username:String,_password:String)->Bool{
        if _username == username{
            if _password == password{
                return true
            }
        }
        return false
    }
}
