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
        }
    }
}

extension AppScreenState {
    static func == (lhs: AppScreenState, rhs: AppScreen) -> Bool {
        switch (lhs, rhs) {
        case (.splash, .splash), (.auth, .auth), (.home, .home):
            return true
        case (.splash, _), (.auth, _), (.home, _):
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
