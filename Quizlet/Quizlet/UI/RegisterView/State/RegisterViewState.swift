//
//  RegisterViewState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

struct RegisterViewState {
    let name: String
    let userName: String
    let password: String
    let checkPasswordText: String
    let errorMessage: String?
}

extension RegisterViewState {
    init() {
        name = ""
        userName = ""
        password = ""
        checkPasswordText = ""
        errorMessage = nil
    }
}
