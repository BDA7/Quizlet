//
//  SplashView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI
import QuizletRedux

struct SplashView: View {
    @EnvironmentObject var store: Store<AppState>
    
    var state: SplashViewState? { store.publicState.screenState(for: .splash) }
    
    var body: some View {
        Text("Splash Screen")
            .font(.title)
            .onAppear {
                store.dispatch(SplashViewStateAction.checkAuth)
            }
        
    }
}

#Preview {
    SplashView()
}
