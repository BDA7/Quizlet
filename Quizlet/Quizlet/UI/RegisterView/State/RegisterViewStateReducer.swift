//
//  RegisterViewStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import QuizletRedux

extension RegisterViewState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case RegisterViewStateAction.showError(let message):
            return RegisterViewState(
                name: state.name,
                userName: state.userName,
                password: state.password,
                checkPasswordText: state.checkPasswordText,
                errorMessage: message
            )
        case RegisterViewStateAction.discardError:
            return RegisterViewState(
                name: state.name,
                userName: state.userName,
                password: state.password,
                checkPasswordText: state.checkPasswordText,
                errorMessage: nil
            )
        default: return state
        }
    }
}
