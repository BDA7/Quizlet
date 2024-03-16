//
//  AppState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
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
