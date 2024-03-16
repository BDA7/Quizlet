//
//  AppState+ScreenStateSelector.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

extension AppState {
    func screenState<State>(for screen: AppScreen) -> State? {
        return activeScreens.screens
            .compactMap {
                switch ($0, screen) {
                case (.homeView(let state), .homeView): return state as? State
                default: return nil
                }
            }
            .first
    }
}
