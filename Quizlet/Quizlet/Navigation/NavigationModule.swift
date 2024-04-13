//
//  NavigationModule.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import Combine

final class NavigationModule: ObservableObject {
    @Published var screen: [NavigationCases] = []
    
    static public let shared = NavigationModule()

    private init() {}
    
    public func navigateTo(_ screen: NavigationCases) {
        switch screen {
            
        default:
            break
        }
    }

}

extension NavigationModule {
    struct NavigationCases {
        
    }
}
