//
//  ChapterGrid.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI
import QuizletRedux

struct ChapterGrid: View {
    @EnvironmentObject var store: Store<AppState>
    
    var state: HomeViewState? { store.publicState.screenState(for: .home) }
    
    let chapterModel: ChapterModel
    let themes: [ThemeModel]
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 180, maximum: 500)),
        GridItem(.adaptive(minimum: 150))
    ]
    
    public init(chapterModel: ChapterModel, themes: [ThemeModel]) {
        self.chapterModel = chapterModel
        self.themes = themes
    }
    
    var body: some View {
        VStack {
            nameChapterView
            themesCollection
        }
    }
    
    private var nameChapterView: some View {
        HStack {
            Text(chapterModel.name)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var themesCollection: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(themes) { theme in
                ThemeCell(themeModel: theme, action: {
                    NavigationModule.shared.navigateTo(.showScreen(.questionsByTheme(id: theme.id)))
                })
            }
        })
    }
}

#Preview {
    ChapterGrid(chapterModel: ChapterModel(name: "Какой-то чаптер", chapterId: 0), themes: [
        ThemeModel(title: "Какая", themeId: 0, chapterId: 0),
        ThemeModel(title: "тема", themeId: 1, chapterId: 0),
        ThemeModel(title: "Какая-то темаgregergergbtbttbtr", themeId: 2, chapterId: 0),
        ThemeModel(title: "Какая-то", themeId: 3, chapterId: 0),
        ThemeModel(title: "Какая-то т", themeId: 4, chapterId: 0),
        ThemeModel(title: "то тема", themeId: 5, chapterId: 0),

    ])
    .environmentObject(store)
}
