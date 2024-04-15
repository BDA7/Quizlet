//
//  ProfileRepository.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation
import Combine

final class ProfileRepository: ObservableObject {
    private let userDefaults = UserDefaults.standard

    func getUserProfile() -> AnyPublisher<ProfileModel, Never> {
        guard let userName = userDefaults.string(forKey: "currentUserName") else {
            return Empty().eraseToAnyPublisher()
        }
        
        return Future<ProfileModel, Never> { promise in
            RealmService.shared.getCurrentProfile(userName: userName) { profile in
                if let profile = profile {
                    promise(.success(profile))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
