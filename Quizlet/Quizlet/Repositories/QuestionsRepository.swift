//
//  QuestionsRepository.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import Combine

final class QuestionsRepository: ObservableObject {
    public func getChapters() -> AnyPublisher<[ChapterModel], Never> {
        return Future<[ChapterModel], Never> { promise in
            RealmService.shared.getChapters { chapters in
                promise(.success(chapters))
            }
        }
        .eraseToAnyPublisher()
    }
    
    public func getThemes() -> AnyPublisher<[ThemeModel], Never> {
        return Future<[ThemeModel], Never> { promise in
            RealmService.shared.getThemesByChapter { themes in
                promise(.success(themes))
            }
        }
        .eraseToAnyPublisher()
    }
    
    public func getQuestionsByTheme(_ themeId: String) -> AnyPublisher<[QuestionModel], Never> {
        return Future<[QuestionModel], Never> { promise in
            RealmService.shared.getQuestions(themeId) { questions in
                promise(.success(questions))
            }
        }
        .eraseToAnyPublisher()
    }
}
