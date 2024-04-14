//
//  QuestionsByThemeState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

struct QuestionsByThemeState {
    let themeId: Int
    let questions: [QuestionModel]
    let currentQuestion: QuestionModel?
}

extension QuestionsByThemeState {
    init(id: Int) {
        themeId = id
        questions = []
        currentQuestion = nil
    }
}
