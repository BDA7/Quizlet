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
        case ProfileViewStateAction.fetchResults:
            return questionsRepository.getUserResults()
                .map { results in
                    ProfileViewStateAction.updateResults(results: results)
                }
                .eraseToAnyPublisher()
        case QuestionsByThemeStateAction.updateResults(let finalScore, let themeName):
            questionsRepository.updateResults(finalScore, themeName: themeName)
            return Empty().eraseToAnyPublisher()
                
        default: return Empty().eraseToAnyPublisher()
        }
    }
}
