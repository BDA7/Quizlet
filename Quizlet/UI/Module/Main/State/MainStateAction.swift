//
//  MainStateAction.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

enum MainStateAction: Action {
    case fetchQuestionThemes
    case didReceiveQuestionThemes(themes: [ThemesDTO])
}
