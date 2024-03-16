//
//  MainStateActionReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

extension MainState {
    static let reducer: Reducer<Self> = {state, action in
        switch action {
        case MainStateAction.fetchQuestionThemes:
            return MainState()
        case MainStateAction.didReceiveQuestionThemes(let themes):
            return MainState(themes: themes)
        default: return state
        }
    }
}
