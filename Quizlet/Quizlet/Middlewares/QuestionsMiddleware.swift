//
//  QuestionsMiddleware.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import Combine
import QuizletRedux

extension Middlewares {
    private static let questionsRepository = QuestionsRepository()
    
    static let questions: Middleware<AppState> = { state, action in
        switch action {
        case HomeViewStateAction.fetchChapters:
            return questionsRepository.getChapters()
                .map { chapters in
                    HomeViewStateAction.updateChapters(chapters)
                }
                .eraseToAnyPublisher()
            
        case QuestionsByThemeStateAction.fetchQuestions(let themeId):
            return questionsRepository.getQuestionsByTheme(themeId)
                .map { questions in
                    QuestionsByThemeStateAction.updateQuestions(questions)
                }
                .eraseToAnyPublisher()
        case HomeViewStateAction.fetchThemes:
            return questionsRepository.getThemes()
                .map { themes in
                    HomeViewStateAction.updateThemes(themes)
                }
                .eraseToAnyPublisher()
            
        default: return Empty().eraseToAnyPublisher()
        }
    }
}
