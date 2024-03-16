//
//  AnyCancellable.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Combine
import Foundation

extension AnyCancellable {
    func store(in dictionary: inout [UUID: AnyCancellable], key: UUID) {
        dictionary[key] = self
    }
}
