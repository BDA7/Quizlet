//
//  HomeViewState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

struct HomeViewState {
    let chapters: [ChapterModel]
    let themes: [ThemeModel]
}

extension HomeViewState {
    init() {
        chapters = []
        themes = []
    }
}
