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
    middlewares: [Middlewares.questions, Middlewares.logger]
)

struct AppView: View {
    @EnvironmentObject var store: Store<AppState>

    var body: some View {
        if store.state.screenState(for: .mainView) as MainState? != nil ||
           store.state.screenState(for: .profile) as ProfileState? != nil{
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
