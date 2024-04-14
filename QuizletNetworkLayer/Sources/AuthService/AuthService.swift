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
    
    public func chechAuth() -> AnyPublisher<Bool, NetworkError> {
        let isAuthorize = userDefaults.bool(forKey: "isAuthorize")
        return Just(isAuthorize)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
        
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
    
    public func authorize(_ userName: String, password: String) -> AnyPublisher<Void, NetworkError> {
        if let userData = userDefaults.object(forKey: "userModel") as? Data,
            let userModel = try? JSONDecoder().decode(AuthModel.self, from: userData),
            userName == userModel.userName, password == userModel.password
        {
            authorizeFlagToogle(isAuthorize: true)
            return Just(())
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
        
        authorizeFlagToogle(isAuthorize: false)
        return Fail(error: NetworkError.authLoose).eraseToAnyPublisher()
    }
    
    private func authorizeFlagToogle(isAuthorize: Bool) {
        userDefaults.setValue(isAuthorize, forKey: "isAuthorize")
    }
}
