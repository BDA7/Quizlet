//
//  AppState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

struct AppState {
    let activeScreens: ActiveScreensState
}

extension AppState {
    init() {
        activeScreens = ActiveScreensState()
    }
}
