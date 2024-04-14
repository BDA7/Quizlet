//
//  AuthViewStateAction.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

enum AuthViewStateAction: Action {
    case authorize(_ userName: String, password: String)
    case showError(message: String)
    case discardError
}
