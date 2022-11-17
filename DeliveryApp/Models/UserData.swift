//
//  UserEmails.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 17/11/22.
//

import UIKit
import KeychainSwift

class UserData {
    static let shared = UserData()
    
    var userDefaults = UserDefaults.standard
    var keychain = KeychainSwift()
    
    private init() {
        
    }
}
