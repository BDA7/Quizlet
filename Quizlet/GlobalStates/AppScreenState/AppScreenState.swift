//
//  AppScreenState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

enum AppScreenState {
    case splashScreen
    case homeView(HomeState)
}

extension AppScreenState: CustomStringConvertible {
    var description: String {
        switch self {
        case .splashScreen: return "splashScreen"
        case .homeView: return "homeView"
        }

    }
}

extension AppScreenState {
    static func == (lhs: AppScreenState, rhs: AppScreen) -> Bool {
        switch (lhs, rhs) {
        case (.splashScreen, .splashScreen): return true
        case (.homeView, .homeView): return true
        case (.homeView, _), (.splashScreen, _): return false
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
