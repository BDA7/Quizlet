//
//  AuthViewState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

struct AuthViewState {
    let userName: String
    let password: String
    let errorMessage: String?
}

extension AuthViewState {
    init() {
        userName = ""
        password = ""
        errorMessage = nil
    }
}
