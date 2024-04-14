//
//  AppScreenState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

enum AppScreenState {
    case auth(AuthViewState)
    case splash(SplashViewState)
    case home(HomeViewState)
    case register(RegisterViewState)
    case questionsByTheme(QuestionsByThemeState)
}

extension AppScreenState: CustomStringConvertible {
    var description: String {
        switch self {
        case .auth:
            return "Auth View"
        case .splash:
            return "Splash View"
        case .home:
            return "Home View"
        case .register:
            return "Register View"
        case .questionsByTheme(let state):
            return "Questions View \(state.themeId)"
        }
    }
}

extension AppScreenState {
    static func == (lhs: AppScreenState, rhs: AppScreen) -> Bool {
        switch (lhs, rhs) {
        case (.splash, .splash), (.auth, .auth), (.home, .home), (.register, .register):
            return true
        case (.questionsByTheme(let state), .questionsByTheme(let id)): return state.themeId == id
        case (.splash, _), (.auth, _), (.home, _), (.register, _), (.questionsByTheme, _):
            return false
        }
    }
    
    static func == (lhs: AppScreen, rhs: AppScreenState) -> Bool {
        rhs == lhs
    }

    static func != (lhs: AppScreen, rhs: AppScreenState) -> Bool {
        !(lhs == rhs)
    }

    static func != (lhs: AppScreenState, rhs: AppScreen) -> Bool {
        !(lhs == rhs)
    }
}
