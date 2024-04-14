//
//  AuthViewStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

extension AuthViewState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case AuthViewStateAction.showError(let message):
            return AuthViewState(
                userName: state.userName,
                password: state.password,
                errorMessage: message
            )
        case AuthViewStateAction.discardError:
            return AuthViewState(
                userName: state.userName,
                password: state.password,
                errorMessage: nil
            )
        default: return state
        }
    }
}
