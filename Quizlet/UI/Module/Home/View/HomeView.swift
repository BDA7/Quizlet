//
//  HomeView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: Store<AppState>
    var state: HomeState? { store.state.screenState(for: .homeView) }
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
            MainView()
                .onAppear {
                    store.dispatch(ActiveScreensStateAction.showScreen(.mainView))
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }.tag(1)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Профиль")
                }.tag(2)
        })
    }
}

#Preview {
    HomeView()
        .environmentObject(store)
}
