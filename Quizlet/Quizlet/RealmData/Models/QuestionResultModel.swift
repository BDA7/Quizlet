//
//  QuestionResultModel.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation

struct QuestionResultModel {
    let finalScore: Float
    let themeName: String
    let userName: String
}

extension QuestionResultModel: Identifiable {
    var id: String {
        return userName + themeName
    }
}
