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
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch action {
            
            case .showScreen(.auth):
                screens = [.auth]
            case .showScreen(.home):
                screens = [.home]
            case .showScreen(.register):
                screens.append(.register)
            case .dismissScreen:
                screens.removeLast()
            case .showScreen(.questionsByTheme(let id)):
                screens.append(.questionsByTheme(id: id))
            }
        }
        
    }

}

extension NavigationModule {
    enum NavigationCases: Hashable {
        case register
        case home
        case auth
        case questionsByTheme(id: String)
    }
    
    enum NavigationActions {
        case showScreen(NavigationCases)
        case dismissScreen
    }
}
