//
//  AuthService.swift
//
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

final class AuthService {
    private let userDefaults = UserDefaults.standard
    
    public func chechAuth(_ userName: String, _ password: String) -> AuthModel? {
        if let userModel = userDefaults.object(forKey: "userModel") as? AuthModel {
            return userModel
        }
        
        return nil
    }
    
    public func register(_ userName: String, _ password: String) {
        let authModel = AuthModel(name: userName, password: password)
        
        userDefaults.setValue(authModel, forKey: "userModel")
    }
}
