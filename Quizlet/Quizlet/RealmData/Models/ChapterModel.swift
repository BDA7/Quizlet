//
//  ChapterModel.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

struct ChapterModel: Identifiable {
    let name: String
    let chapterId: Int
}

extension ChapterModel {
    var id: Int {
        return chapterId
    }
}
