//
//  SplashView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        Text("Splash Screen")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    store.dispatch(ActiveScreensStateAction.showScreen(.mainView))
                    
                }
            }
    }
}

#Preview {
    SplashView()
}
