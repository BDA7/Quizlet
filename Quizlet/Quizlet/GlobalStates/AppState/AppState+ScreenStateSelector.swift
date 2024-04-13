//
//  AppState+ScreenStateSelector.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

extension AppState {
    func screenState<State>(for screen: AppScreen) -> State? {
        return activeScreens.screens
            .compactMap {
                switch ($0, screen) {
                case (.auth(let state), .auth): return state as? State
                case (.home(let state), .home): return state as? State
                case (.register(let state), .register): return state as? State
                default: return nil
                    
                }
                
            }
            .first
    }
}
