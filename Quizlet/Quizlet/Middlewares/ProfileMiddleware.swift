//
//  ProfileMiddleware.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Combine
import QuizletRedux

extension Middlewares {
    private static let profileRepository = ProfileRepository()
    
    static let profile: Middleware<AppState> = { state, action in
        switch action {
        case ProfileViewStateAction.fetchProfile:
            return profileRepository.getUserProfile()
                .map { profile in
                    ProfileViewStateAction.updateProfile(profile)
                }
                .eraseToAnyPublisher()
        default: return Empty().eraseToAnyPublisher()
        }
    }
}
