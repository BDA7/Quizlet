//
//  AuthService.swift
//
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import Combine

public final class AuthService: ObservableObject {
    private let userDefaults = UserDefaults.standard
    
    public init() {}
    
    public func chechAuth() -> AnyPublisher<AuthModel, NetworkError> {
        if let userModel = userDefaults.object(forKey: "userModel") as? AuthModel {
            return Just(userModel)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: NetworkError.authLoose).eraseToAnyPublisher()
    }
    
    public func register(_ userName: String, _ password: String) {
        let authModel = AuthModel(name: userName, password: password)
        
        userDefaults.setValue(authModel, forKey: "userModel")
    }
}
