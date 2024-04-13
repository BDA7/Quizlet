//
//  Middlewares.swift
//
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import Combine

public enum Middlewares {}

public typealias Middleware<State> = (State, Action) -> AnyPublisher<Action, Never>
