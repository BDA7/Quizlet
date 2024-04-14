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
            
        default: return Empty().eraseToAnyPublisher()
        }
    }
}
