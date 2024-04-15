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
        case .register(let state): return .register(RegisterViewState.reducer(state, action))
        case .questionsByTheme(let state): return .questionsByTheme(QuestionsByThemeState.reducer(state, action))
        case .profile(let state): return .profile(ProfileViewState.reducer(state, action))
        case .results(let state): return .results(ResultsViewState.reducer(state, action))
        }
    }
}
