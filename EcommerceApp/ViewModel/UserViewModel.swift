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
    
    let username:String = "seba"
    let password:String = "123"
    
    
    
    func validation(_username:String,_password:String)->Bool{
        if _username == username{
            if _password == password{
                return true
            }
        }
        return false
    }
}
