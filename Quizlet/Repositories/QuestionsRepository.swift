//
//  QuestionsRepository.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation
import Combine

final class QuestionsRepository: ObservableObject {
    private let mockManager = MockManager()
    
    func fetchThemes() -> AnyPublisher<[ThemesDTO], AppError> {
        return mockManager.fetchThemes()
    }
}
