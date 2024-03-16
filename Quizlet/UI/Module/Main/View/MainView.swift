//
//  MainView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var store: Store<AppState>
    var state: MainState? { store.state.screenState(for: .mainView) }

    
    var body: some View {
        VStack {
            Button("sefr") {
                store.dispatch(MainStateAction.fetchQuestionThemes)
            }
            ForEach(state?.themes ?? []) { theme in
                Text(theme.nameTheme)
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(store)
}
