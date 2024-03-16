//
//  ActiveScreensStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

extension ActiveScreensState {
    static let reducer: Reducer<Self> = { state, action in
        var screens = state.screens

        // Update visible screens
        if let action = action as? ActiveScreensStateAction {
            switch action {
            case .showScreen(.splashScreen), .dismissScreen(.splashScreen): screens = [.splashScreen]
            case .dismissScreen(let screen): screens = screens.filter { $0 != screen }
            case .showScreen(.homeView): screens = [.homeView(HomeState())]
            case .showScreen(.mainView): screens = [.mainView(MainState())]
            case .showScreen(.profile): screens = [.profileView(ProfileState())]
            }
        }

        // Reduce each screen state
        screens = screens.map { AppScreenState.reducer($0, action) }

        return ActiveScreensState(screens: screens)
    }
}
