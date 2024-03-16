//
//  HomeView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: Store<AppState>
    @State private var selection = 1
    var state: HomeState? { store.state.screenState(for: .homeView) }
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
            Text("Tab Content 1").tabItem {
                Text("Tab Label 1")
            }.tag(1)
            ProfileView().tabItem {
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
