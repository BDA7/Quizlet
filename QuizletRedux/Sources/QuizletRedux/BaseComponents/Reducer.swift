//
//  Reducer.swift
//
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation

public typealias Reducer<State> = (State, Action) -> State
