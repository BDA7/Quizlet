//
//  ResultsView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import SwiftUI
import QuizletRedux

struct ResultsView: View {
    @EnvironmentObject var store: Store<AppState>
    
    var state: ResultsViewState? { store.publicState.screenState(for: .results) }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
        }
        .onAppear {
            store.dispatch(ActiveScreensStateAction.showScreen(.results))
        }
    }
}

#Preview {
    ResultsView()
        .environmentObject(store)
}
