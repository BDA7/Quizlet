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
    
    public func navigateTo(_ screen: NavigationCases) {
        switch screen {
        case .register:
            self.screens.append(.register)
        }
        
        print(screens)
    }

}

extension NavigationModule {
    enum NavigationCases {
        case register
    }
}
