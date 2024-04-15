//
//  ProfileViewStateAction.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation
import QuizletRedux

enum ProfileViewStateAction: Action {
    case fetchProfile
    case updateProfile(_ profile: ProfileModel)
}
