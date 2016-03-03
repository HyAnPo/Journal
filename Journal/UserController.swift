//
//  UserController.swift
//  Journal
//
//  Created by Aaron Eliason on 3/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class UserController {

    
    static let sharedController = UserController()
    
    //current user property, implicity unwrapped
    
    func createUser(email:String, password: String) {
        
        let ref = FirebaseController.base
        
        ref.createUser(email, password: password) { (error, resultsDictionary) -> Void in
            if error != nil {
                print(error.localizedDescription)
            }else {
                print("successfully created user! With email: \(email)")
            }
        }
    }
    func loginUser (email:String, password: String) {
        
        let ref = FirebaseController.base
        
        ref.authUser(email, password: password) { (error , authData) -> Void in
            if error != nil {
                print(error.localizedDescription)
            }else {
                print("successfully loged in :) with email \(email)")
            }
        }
    }
    
}