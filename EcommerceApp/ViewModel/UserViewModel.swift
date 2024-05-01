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
    
    let exampleUser:User
    
    init(exampleUser: User) {
        self.exampleUser = exampleUser
    }
    
    func validation(username:String,password:String)->Bool{
        if username == exampleUser.username{
            if password == exampleUser.password{
                return true
            }
        }
        return false
    }
    
}
