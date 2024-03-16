//
//  Store.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation
import Combine
import SwiftUI

enum Middlewares {}
protocol Action {}
struct NoOpAction: Action {}

typealias Reducer<State> = (State, Action) -> State
typealias Middleware<State> = (State, Action) -> AnyPublisher<Action, Never>

final class Store<State>: ObservableObject {
    @Published private(set) var state: State

    private var subscriptions: [UUID: AnyCancellable] = [:]

    private let queue = DispatchQueue(label: "com.danyxw.Quizlet.store", qos: .userInitiated)
    private let reducer: Reducer<State>
    private let middlewares: [Middleware<State>]
    
    init(
        initial state: State,
        reducer: @escaping Reducer<State>,
        middlewares: [Middleware<State>]
    ) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    func restoreState(_ state: State) {
        self.state = state
    }

    func dispatch(_ action: Action) {
        queue.sync { [weak self] in
            guard let self else { return }
            self.dispatch(self.state, action)
        }
    }

    private func dispatch(_ currentState: State, _ action: Action) {
        let newState = reducer(currentState, action)

        middlewares.forEach { middleware in
            let key = UUID()
            middleware(newState, action)
                .receive(on: RunLoop.main)
                .handleEvents(receiveCompletion: { [weak self] _ in self?.subscriptions.removeValue(forKey: key) })
                .sink(receiveValue: dispatch)
                .store(in: &subscriptions, key: key)
        }

        withAnimation {
            state = newState
        }
    }
}
