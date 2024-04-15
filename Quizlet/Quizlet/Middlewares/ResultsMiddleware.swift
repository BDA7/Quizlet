//
//  ResultsMiddleware.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Combine
import QuizletRedux

extension Middlewares {
    private static let questionsRepository = ResultsRepository()
    
    static let results: Middleware<AppState> = { state, action in
        switch action {
        default: return Empty().eraseToAnyPublisher()
        }
    }
}
