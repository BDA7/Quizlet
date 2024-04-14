//
//  AuthorizationMiddleware.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import Combine
import QuizletRedux
import QuizletNetworkLayer

extension Middlewares {
    private static let authRepository = AuthService()
    
    static let authorization: Middleware<AppState> = { state, action in
        switch action {
        case SplashViewStateAction.checkAuth:
            return authRepository.chechAuth()
                .map { model in
                    ActiveScreensStateAction.showScreen(.home)
                }
                .catch({ _ in
                    Just(ActiveScreensStateAction.showScreen(.auth)).eraseToAnyPublisher()
                })
                .eraseToAnyPublisher()
        case RegisterViewStateAction.register(let userName, let name, let password, let checkPassword):
            return authRepository.register(userName: userName, name: name, password: password, checkPassword: checkPassword)
                .map { _ in
                    NavigationModule.shared.navigateTo(.removeLast)
                    return ActiveScreensStateAction.showScreen(.auth)
                }
                .catch { netErro in
                    Just(RegisterViewStateAction.showError(netErro.localizedDescription)).eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()
        default: return Empty().eraseToAnyPublisher()
        }
        
    }
}

extension Publisher {
    func ignoreError() -> AnyPublisher<Output, Never> {
        self
        .catch { _ in Empty() }
        .eraseToAnyPublisher()
    }
}
