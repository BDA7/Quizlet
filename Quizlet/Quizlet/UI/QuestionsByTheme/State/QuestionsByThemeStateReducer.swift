//
//  QuestionsByThemeStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

extension QuestionsByThemeState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case QuestionsByThemeStateAction.updateQuestions(let questions):
            return QuestionsByThemeState(themeId: state.themeId, questions: questions)
        default: return state
        }
    }
}
