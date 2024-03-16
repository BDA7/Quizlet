//
//  AppStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

extension AppState {
    static let reducer: Reducer<Self> = { state, action in
        AppState(
            activeScreens: ActiveScreensState.reducer(state.activeScreens, action)
        )
    }
}
