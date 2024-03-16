//
//  ActiveScreensStateAction.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

enum AppScreen {
    case splashScreen
    case homeView
}

enum ActiveScreensStateAction: Action {
    case showScreen(AppScreen)
    case dismissScreen(AppScreen)
}
