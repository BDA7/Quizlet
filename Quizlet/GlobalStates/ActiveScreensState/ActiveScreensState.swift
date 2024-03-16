//
//  ActiveScreensState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

struct ActiveScreensState {
    let screens: [AppScreenState]
}

extension ActiveScreensState {
    init() {
        screens = [.mainView(MainState())]
    }
}
