//
//  HomeViewStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

extension HomeViewState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case HomeViewStateAction.updateChapters(let chapters):
            return HomeViewState(chapters: chapters, themes: state.themes)
        case HomeViewStateAction.updateThemes(let themes):
            return HomeViewState(chapters: state.chapters, themes: themes)
        default: return state
        }
    }
}
