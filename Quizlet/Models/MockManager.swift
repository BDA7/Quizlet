//
//  MockManager.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation
import Combine

final class MockManager {
    let bundleMain = Bundle.main
    let decoder = JSONDecoder()
    
    func fetchThemes() -> AnyPublisher<[ThemesDTO], AppError> {
        return perform(.themes)
    }
}

extension MockManager {
    private func perform<T: Decodable>(_ mockName: MockEnum) -> AnyPublisher<T, AppError> {
        guard let url = bundleMain.url(forResource: mockName.rawValue, withExtension: "json") else {
            return Fail(error: AppError.fileUrlError).eraseToAnyPublisher()
        }
        
        if let url = bundleMain.url(forResource: mockName.rawValue, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return Just(data)
                    .decode(type: T.self, decoder: decoder)
                    .mapError { error in
                        if let appError = error as? AppError {
                            return appError
                        } else {
                            return AppError.unknown(error)
                        }
                    }
                    .eraseToAnyPublisher()
            } catch {
                return Fail(error: AppError.decoding(error)).eraseToAnyPublisher()
            }
        }
        
        return Empty().eraseToAnyPublisher()
    }
}

extension MockManager {
    enum MockEnum: String {
        case themes = "Themes"
    }
}
