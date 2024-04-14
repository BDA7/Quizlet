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
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            
            VStack {
                ScrollView {
                    VStack {
                        if let chapters = state?.chapters {
                            ForEach(chapters) { chapter in
                                Text(chapter.name)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            store.dispatch(ActiveScreensStateAction.showScreen(.home))
            store.dispatch(HomeViewStateAction.fetchChapters)
        }
    }
}

#Preview {
    HomeView()
}
