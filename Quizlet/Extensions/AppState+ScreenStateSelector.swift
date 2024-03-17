//
//  AppState+ScreenStateSelector.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

extension AppState {
    func screenState<State>(for screen: AppScreen) -> State? {
        let screen = activeScreens.screens
            .compactMap {
                switch ($0, screen) {
                case (.mainView(let state), .mainView):
                    return state as? State
                case (.profileView(let state), .profile): return state as? State

                default: return nil
                }
            }
            .first
        return screen
    }
}
