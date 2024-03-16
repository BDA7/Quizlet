//
//  AppErrors.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

enum AppError: Error {
    case decoding(_ error: Error)
    case urlError(_ error: Error)
    case emptyData
    case fileUrlError
    case unknown(_ error: Error)
    
    var errorDescription: String {
        switch self {
        case .decoding(let error):
            return "decoding error: \(error.localizedDescription)"
        case .urlError(let error):
            return "url error: \(error.localizedDescription)"
        case .emptyData:
            return "error: Data is empty"
        case .fileUrlError:
            return "file is not found"
        case .unknown(let error):
            return "error \(error.localizedDescription)"
        }
    }
}
