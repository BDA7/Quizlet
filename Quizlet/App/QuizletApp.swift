//
//  QuizletApp.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import SwiftUI

let store = Store(
    initial: AppState(),
    reducer: AppState.reducer,
    middlewares: []
)

struct AppView: View {
    @EnvironmentObject var store: Store<AppState>

    var body: some View {
        if store.state.screenState(for: .homeView) as HomeState? != nil {
            NavigationView {
                HomeView()
            }
            .navigationViewStyle(.stack)
        } else {
            SplashView()
        }
    }
}

@main
struct QuizletApp: App {
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(store)
        }
    }
}
