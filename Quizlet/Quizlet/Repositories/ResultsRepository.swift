//
//  ResultsRepository.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation
import Combine
import QuizletNetworkLayer

final class ResultsRepository: ObservableObject {
    private let userDefaults = UserDefaults.standard

    
    func getUserResults() -> AnyPublisher<[QuestionResultModel], Never> {
        guard let userName = userDefaults.string(forKey: "currentUserName") else {
            return Empty().eraseToAnyPublisher()
        }
        
        
        return Future<[QuestionResultModel], Never> { promise in
            RealmService.shared.getUserResults(userName) { results in
                promise(.success(results))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func addResult(_ resultModel: QuestionResultModel) -> AnyPublisher<Void, Never> {
        RealmService.shared.addQuestionResult(resultModel)
        
        return Just(()).eraseToAnyPublisher()
    }
    
    func getAllResults() -> AnyPublisher<[QuestionResultModel], Never> {
        return Future<[QuestionResultModel], Never> { promise in
            RealmService.shared.getAllResults { results in
                promise(.success(results))
            }
        }
        .eraseToAnyPublisher()
    }
}
