//
//  HomeView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI
import QuizletRedux

struct HomeView: View {
    @EnvironmentObject var store: Store<AppState>
    
    var state: HomeViewState? { store.publicState.screenState(for: .home) }
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                store.dispatch(ActiveScreensStateAction.showScreen(.home))
            }
    }
}

#Preview {
    HomeView()
}
