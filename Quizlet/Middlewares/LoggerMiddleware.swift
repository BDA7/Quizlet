//
//  LoggerMiddleware.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 17.03.2024.
//

import Foundation
import Combine

extension Middlewares {
    static let logger: Middleware<AppState> = { state, action in
        let stateDescription = "\(state)".replacingOccurrences(of: "ReduxDemo.", with: "")
        print("➡️ \(action)\n✅ \(stateDescription)\n")

        return Empty().eraseToAnyPublisher()
    }
}
