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
        case .homeView(let state): return .homeView(HomeState.reducer(state, action))
        case .mainView(let state): return .mainView(MainState.reducer(state, action))
        case .profileView(let state): return .profileView(ProfileState.reducer(state, action))
        }
    }
}
