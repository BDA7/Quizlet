//
//  HomeViewStateAction.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

enum HomeViewStateAction: Action {
    case fetchChapters
    case updateChapters(_ chapters: [ChapterModel])
    case fetchThemes
    case updateThemes(_ themes: [ThemeModel])
}
