//
//  ActiveScreensStateAction.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

enum AppScreen: Hashable {
    case auth
    case splash
    case home
}

enum ActiveScreensStateAction: Action {
    case showScreen(AppScreen)
    case dismissScreen(AppScreen)
}
