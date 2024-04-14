//
//  QuestionsByThemeStateAction.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

enum QuestionsByThemeStateAction: Action {
    case fetchQuestions(_ themeId: Int)
    case updateQuestions(_ questions: [QuestionModel])
}
