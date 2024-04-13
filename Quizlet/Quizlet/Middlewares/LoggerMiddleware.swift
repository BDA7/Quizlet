//
//  LoggerMiddleware.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Combine
import QuizletRedux

extension Middlewares {
    static let logger: Middleware<AppState> = { state, action in
        let stateDescription = "\(state)".replacingOccurrences(of: "ReduxDemo.", with: "")
        print("➡️ \(action)\n✅ \(stateDescription)\n")

        return Empty().eraseToAnyPublisher()
    }
}
