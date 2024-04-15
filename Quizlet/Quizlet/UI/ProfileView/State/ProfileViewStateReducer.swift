//
//  ProfileViewStateReducer.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation
import QuizletRedux

extension ProfileViewState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case ProfileViewStateAction.updateProfile(let profileModel):
            return ProfileViewState(profileModel: profileModel, results: state.results)
        case ProfileViewStateAction.updateResults(let results):
            return ProfileViewState(profileModel: state.profileModel, results: results)
        default: return state
        }
    }
}
