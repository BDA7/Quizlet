//
//  HomeView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI
import QuizletRedux

struct HomeView: View {
    @EnvironmentObject var store: Store<AppState>
    
    var state: HomeViewState? { store.publicState.screenState(for: .home) }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            
            VStack {
                ScrollView {
                    VStack {
                        if let chapters = state?.chapters, let themes = state?.themes {
                            ForEach(chapters) { chapter in
                                ChapterGrid(
                                    chapterModel: chapter,
                                    themes: themes.filter { $0.chapterId == chapter.chapterId }
                                )
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            store.dispatch(ActiveScreensStateAction.showScreen(.home))
            store.dispatch(HomeViewStateAction.fetchChapters)
            store.dispatch(HomeViewStateAction.fetchThemes)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(store)
}
