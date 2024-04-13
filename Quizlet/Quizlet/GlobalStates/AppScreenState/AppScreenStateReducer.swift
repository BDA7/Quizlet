//
//  AppScreenStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

extension AppScreenState {
    static let reducer: Reducer<Self> = { state, action in
        switch state {
            
        case .auth(let state): return .auth(AuthViewState.reducer(state, action))
        case .splash(let state): return .splash(SplashViewState.reducer(state, action))
        case .home(let state): return .home(HomeViewState.reducer(state, action))
        }
    }
}
