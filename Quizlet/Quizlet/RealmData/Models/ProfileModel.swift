//
//  ProfileModel.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation

struct ProfileModel: Identifiable {
    let userName: String
    var firstName: String
    var password: String
}

extension ProfileModel {
    var id: String {
        return userName
    }
}
