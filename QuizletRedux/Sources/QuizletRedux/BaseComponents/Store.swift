//
//  Store.swift
//
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Combine
import Foundation
import SwiftUI

public final class Store<State>: ObservableObject {
    @Published private var state: State
    
    public var publicState: State {
        state
    }

    private var subscriptions: [UUID: AnyCancellable] = [:]

    private let queue = DispatchQueue(label: "com.NordClan.Quizlet.store", qos: .userInteractive)
    private let reducer: Reducer<State>
    private let middlewares: [Middleware<State>]
    
    public init(
        initial state: State,
        reducer: @escaping Reducer<State>,
        middlewares: [Middleware<State>]
    ) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    public func restoreState(_ state: State) {
        self.state = state
    }
    
    public func dispatch(_ action: Action) {
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

//        withAnimation(.easeInOut(duration: 0.5)) {
//        }
        state = newState

    }
}

extension AnyCancellable {
    func store(in dictionary: inout [UUID: AnyCancellable], key: UUID) {
        dictionary[key] = self
    }
}

