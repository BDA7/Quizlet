//
//  ProfileViewState.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation

struct ProfileViewState {
    let profileModel: ProfileModel?
}

extension ProfileViewState {
    init() {
        profileModel = nil
    }
}
