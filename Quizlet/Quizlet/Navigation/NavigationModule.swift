//
//  NavigationModule.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import Combine

final class NavigationModule: ObservableObject {
    @Published var screens: [NavigationCases] = []
    
    static public let shared = NavigationModule()

    private init() {}
    
    public func navigateTo(_ action: NavigationActions) {
        switch action {
        
        case .showScreen(.auth):
            screens = [.auth]
        case .showScreen(.home):
            screens = [.home]
        case .showScreen(.register):
            screens.append(.register)
        case .dismissScreen:
            screens.removeLast()
        }
    }

}

extension NavigationModule {
    enum NavigationCases {
        case register
        case home
        case auth
    }
    
    enum NavigationActions {
        case showScreen(NavigationCases)
        case dismissScreen
    }
}
