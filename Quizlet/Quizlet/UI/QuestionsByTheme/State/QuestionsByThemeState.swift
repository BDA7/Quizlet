//
//  QuestionsByThemeState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

struct QuestionsByThemeState {
    let themeId: String
    let questions: [QuestionModel]
    let currentQuestion: QuestionModel?
}

extension QuestionsByThemeState {
    init(id: String) {
        themeId = id
        questions = []
        currentQuestion = nil
    }
}
