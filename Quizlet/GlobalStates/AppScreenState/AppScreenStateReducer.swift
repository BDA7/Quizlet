//
//  AppScreenStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

extension AppScreenState {
    static let reducer: Reducer<Self> = { state, action in
        switch state {
        case .splashScreen: return .splashScreen
        case .homeView: return .homeView(HomeState())
        }
    }
}
