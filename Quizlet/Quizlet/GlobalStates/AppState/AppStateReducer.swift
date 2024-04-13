//
//  AppStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

extension AppState {
    static let reducer: Reducer<Self> = { state, action in
        AppState(
            activeScreens: ActiveScreensState.reducer(state.activeScreens, action)
        )
    }
}
