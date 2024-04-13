//
//  AuthViewModel.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import Observation
import QuizletNetworkLayer

@Observable
final class AuthViewModel {
    private var isAuth: Bool
    
    init(isAuth: Bool) {
        self.isAuth = isAuth
    }
    
    public func login(_ userName: String, _ password: String) {
        
    }
}
