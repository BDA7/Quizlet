//
//  AppScreenState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

enum AppScreenState {
    case splashScreen
    case profileView(ProfileState)
    case mainView(MainState)
}

extension AppScreenState: CustomStringConvertible {
    var description: String {
        switch self {
        case .splashScreen: return "splashScreen"
        case .mainView: return "mainView"
        case .profileView: return "profileView"
        }

    }
}

extension AppScreenState {
    static func == (lhs: AppScreenState, rhs: AppScreen) -> Bool {
        switch (lhs, rhs) {
        case (.splashScreen, .splashScreen): return true
        case (.profileView, .profile): return true
        case (.mainView, .mainView): return true
        case (.splashScreen, _), (.mainView, _), (.profileView, _): return false
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
