//
//  AuthRepository.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation
import Combine
import QuizletNetworkLayer

final class AuthRepository: ObservableObject {
    private let userDefaults = UserDefaults.standard

    func authorize(userName: String, password: String) -> AnyPublisher<ProfileModel, NetworkError> {
        return Future<ProfileModel, NetworkError> { [weak self] promise in
            RealmService.shared.getProfile(userName: userName, password: password) { profile in
                if let profile = profile {
                    promise(.success(profile))
                    self?.authorizeFlagToogle(isAuthorize: true)
                } else {
                    promise(.failure(NetworkError.authLoose))
                    self?.authorizeFlagToogle(isAuthorize: false)
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    public func register(userName: String, name: String, password: String, checkPassword: String) -> AnyPublisher<Void, NetworkError> {
        guard !userName.isEmpty, !name.isEmpty, !password.isEmpty, password == checkPassword else {
            return Fail(error: NetworkError.failRegister).eraseToAnyPublisher()
        }
        
        let authModel = ProfileModel(userName: userName, firstName: name, password: password)
        RealmService.shared.addProfile(profileModel: authModel)

        
        return Just(())
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
    
    public func chechAuth() -> AnyPublisher<Bool, NetworkError> {
        let isAuthorize = userDefaults.bool(forKey: "isAuthorize")
        return Just(isAuthorize)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
        
    }
    
    private func authorizeFlagToogle(isAuthorize: Bool) {
        userDefaults.setValue(isAuthorize, forKey: "isAuthorize")
    }
}
