//
//  QuestionsByTheme.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI
import QuizletRedux

struct QuestionsByTheme: View {
    @EnvironmentObject var store: Store<AppState>
    
    var state: QuestionsByThemeState? { store.publicState.screenState(for: .questionsByTheme(id: themeId)) }
    
    let themeId: Int
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                store.dispatch(ActiveScreensStateAction.showScreen(.questionsByTheme(id: themeId)))
                store.dispatch(QuestionsByThemeStateAction.fetchQuestions(themeId))
            }
        
    }
}

#Preview {
    QuestionsByTheme(themeId: 0)
        .environmentObject(store)
}
