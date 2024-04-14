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
    
    public func register(userName: String, name: String, password: String, checkPassword: String) -> AnyPublisher<Void, NetworkError> {
        guard !userName.isEmpty, !name.isEmpty, !password.isEmpty, password == checkPassword else {
            return Fail(error: NetworkError.failRegister).eraseToAnyPublisher()
        }
        
        let authModel = AuthModel(userName: userName, name: name, password: password)
        if let authData = try? JSONEncoder().encode(authModel) {
            userDefaults.setValue(authData, forKey: "userModel")
        } else {
            return Fail(error: NetworkError.failRegister).eraseToAnyPublisher()
        }
        
        return Just(())
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
    
}
