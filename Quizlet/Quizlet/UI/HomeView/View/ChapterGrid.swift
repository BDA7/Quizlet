//
//  ChapterGrid.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI

struct ChapterGrid: View {
    let chapterModel: ChapterModel
    let themes: [ThemeModel]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ChapterGrid(chapterModel: ChapterModel(name: "Что-то", chapterId: 0), themes: [])
}
