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
    middlewares: [Middlewares.authorization, Middlewares.logger, Middlewares.questions]
)

struct FlowView: View {
    @EnvironmentObject var store: Store<AppState>
    @StateObject private var navigation = NavigationModule.shared
    var body: some View {
        if store.publicState.screenState(for: .auth) as AuthViewState? != nil {
            authFlow
        } else if store.publicState.screenState(for: .home) as HomeViewState? != nil {
            homeFlow
        } else {
            SplashView()
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
                    case .auth:
                        AuthView()
                            .environmentObject(store)
                    default: EmptyView()
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
    
    private var homeFlow: some View {
        NavigationStack(path: $navigation.screens) {
            MainTabView()
                .environmentObject(store)
                .navigationDestination(for: NavigationModule.NavigationCases.self) { val in
                    switch val {
                    case .questionsByTheme(let id):
                        QuestionsByTheme(themeId: id)
                    default: EmptyView()
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
