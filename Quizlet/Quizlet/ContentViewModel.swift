//
//  ContentViewModel.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 13.04.2024.
//

import Foundation
import QuizletNetworkLayer

final class ContentViewModel: ObservableObject {
    func checkPAckage() {
        let personName = BaseNetworkService.shared.testReadFile()
        print(personName)
    }
}
