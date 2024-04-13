//
//  ActiveScreensState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

struct ActiveScreensState {
    let screens: [AppScreenState]
}

extension ActiveScreensState {
    init() {
        screens = [.splash(SplashViewState())]
    }
}
