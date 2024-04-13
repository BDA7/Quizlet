//
//  ActiveScreensStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

extension ActiveScreensState {
    static let reducer: Reducer<Self> = { state, action in
        var screens = state.screens
        
        if let action = action as? ActiveScreensStateAction {
            
            switch action {
            case .showScreen(.auth):
                screens = [.auth(AuthViewState())]
            case .showScreen(.home):
                screens = [.home(HomeViewState())]
            case .dismissScreen(.auth), .showScreen(.splash), .dismissScreen(.splash), .dismissScreen(.home):
                screens = [.splash(SplashViewState())]
            }
            
        }
        
        // Reduce each screen state
        screens = screens.map { AppScreenState.reducer($0, action) }

        return ActiveScreensState(screens: screens)
    }
}
