//
//  QuizletApp.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 13.04.2024.
//

import SwiftUI
import QuizletRedux

let store = Store(
    initial: AppState(),
    reducer: AppState.reducer,
    middlewares: [Middlewares.authorization, Middlewares.logger]
)

struct FlowView: View {
    @EnvironmentObject var store: Store<AppState>
    @StateObject private var navigation = NavigationModule.shared
    var body: some View {
        if store.publicState.screenState(for: .home) as HomeViewState? != nil {
            HomeView()
                .environmentObject(store)
        } else if store.publicState.screenState(for: .auth) as AuthViewState? != nil {
            authFlow
        } else {
            SplashView()
                .environmentObject(store)
        }
    }
    
    private var authFlow: some View {
        NavigationStack(path: $navigation.screens) {
            AuthView()
                .environmentObject(store)
                .navigationDestination(for: NavigationModule.NavigationCases.self) { val in
                    switch val {
                    case .register:
                        RegisterView()
                            .environmentObject(store)
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
    
}

@main
struct QuizletApp: App {
    var body: some Scene {
        WindowGroup {
            FlowView()
                .environmentObject(store)
        }
    }
}
