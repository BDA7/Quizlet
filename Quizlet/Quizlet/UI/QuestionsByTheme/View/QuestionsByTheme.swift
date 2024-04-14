//
//  QuestionsByTheme.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI
import QuizletRedux
import QuizletCommonUI

struct QuestionsByTheme: View {
    @EnvironmentObject var store: Store<AppState>
    @State private var score: Int = 0
    @State private var currentPage = 0
    
    var state: QuestionsByThemeState? { store.publicState.screenState(for: .questionsByTheme(id: themeId)) }
    
    let themeId: Int
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            
            Group {
                if let questions = state?.questions, questions.count == currentPage {
                    finalScoreView
                } else {
                    questionView
                }
            }
            
        }
        .onAppear {
            store.dispatch(ActiveScreensStateAction.showScreen(.questionsByTheme(id: themeId)))
            store.dispatch(QuestionsByThemeStateAction.fetchQuestions(themeId))
        }
        
    }
    
    private var finalScoreView: some View {
        VStack {
            Text("Your score: \(score)/\(currentPage)")
                .font(.title)
                .foregroundStyle(.black)
        }
    }
    
    private var questionView: some View {
        VStack {
            if let questions = state?.questions, questions.count > 0 {
                PageIdentifier(percentage: CGFloat(currentPage / questions.count))
            }
            
            if let currentQuestion = state?.currentQuestion {
                CurrentQuestionView(currentQuestion: currentQuestion, score: $score, currentPage: $currentPage)
                    .onChange(of: currentPage) { _, newValue in
                        if currentPage < state?.questions.count ?? 0,
                           let newQuestion = state?.questions[currentPage] {
                            store.dispatch(QuestionsByThemeStateAction.changeCurrentQuestion(newQuestion))
                        }
                    }
            }
            
            Spacer()
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    QuestionsByTheme(themeId: 0)
        .environmentObject(store)
}
