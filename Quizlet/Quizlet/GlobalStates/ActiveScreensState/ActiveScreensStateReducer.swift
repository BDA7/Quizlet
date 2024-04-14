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
            case .showScreen(.auth), .dismissScreen(.register):
                screens = [.auth(AuthViewState())]
            case .showScreen(.home), .dismissScreen(.questionsByTheme):
                screens = [.home(HomeViewState())]
            case .showScreen(.register):
                screens += [.register(RegisterViewState())]
            case .showScreen(.questionsByTheme(let id)):
                screens += [.questionsByTheme(QuestionsByThemeState(id: id))]
            case .dismissScreen(.auth), .showScreen(.splash), .dismissScreen(.splash), .dismissScreen(.home):
                screens = [.splash(SplashViewState())]
            }
            
        }
        
        // Reduce each screen state
        screens = screens.map { AppScreenState.reducer($0, action) }

        return ActiveScreensState(screens: screens)
    }
}
