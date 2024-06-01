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
    var username:String?
    var password:String?
    var hasError = false
    var errorMessage: String? = nil
    
    
    func validation(_username:String,_password:String)->Bool{
            if let storedPassword = testFlightCredentials[_username], storedPassword == _password {
                self.username = _username
                return true
            }
            return false
        }
    
    func getUser() -> String?{
        return username
    }
}
