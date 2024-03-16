//
//  QuestionsMiddleware.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation
import Combine

extension Middlewares {
    private static let questionsRepository = QuestionsRepository()
    
    static let questions: Middleware<AppState> = { state, action in
        switch action {
        case MainStateAction.fetchQuestionThemes:
            return questionsRepository.fetchThemes()
                .map { MainStateAction.didReceiveQuestionThemes(themes: $0) }
                .ignoreError()
                .eraseToAnyPublisher()
            
        default:
            return Empty().eraseToAnyPublisher()
        }
    }
}

extension Publisher {
    func ignoreError() -> AnyPublisher<Output, Never> {
        self
        .catch { _ in Empty() }
        .eraseToAnyPublisher()
    }
}
