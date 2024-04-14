//
//  RegisterViewStateAction.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

enum RegisterViewStateAction: Action {
    case register(userName: String, name: String, password: String, checkPassword: String)
    case showError(_ message: String)
    case discardError
}
