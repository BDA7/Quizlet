//
//  RegisterView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI
import QuizletRedux

struct RegisterView: View {
    @EnvironmentObject var store: Store<AppState>
    
    var state: RegisterViewState? { store.publicState.screenState(for: .register) }
    
    var body: some View {
        VStack {
            Text("Register View")
            
        }
        .onAppear {
            store.dispatch(ActiveScreensStateAction.showScreen(.register))
        }
        
    }
}

#Preview {
    RegisterView()
}
