//
//  ThemeModel.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

struct ThemeModel {
    let title: String
    let themeId: Int
    let chapterId: Int
}

extension ThemeModel: Identifiable {
    var id: Int {
        return themeId
    }
}
