//
//  MainState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

struct MainState {
    let themes: [ThemesDTO]
}

extension MainState {
    init() {
        themes = []
    }
}
