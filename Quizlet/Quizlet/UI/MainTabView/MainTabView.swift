//
//  MainTabView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import SwiftUI
import QuizletRedux

struct MainTabView: View {
    @EnvironmentObject var store: Store<AppState>
    
    init() {
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(store)
                .tabItem {
                    Label(
                        title: { Text("Главная") },
                        icon: { Image(systemName: "house") }
                    )
                }
            
            ResultsView()
                .environmentObject(store)
                .tabItem {
                    Label(
                        title: { Text("Таблица лидеров") },
                        icon: { Image(systemName: "star") }
                    )
                }
            
            ProfileView()
                .environmentObject(store)
                .tabItem {
                    Label(
                        title: { Text("Профиль") },
                        icon: { Image(systemName: "person") }
                    )
                }
        }
        .tint(.orange)
    }
}

#Preview {
    MainTabView()
        .environmentObject(store)
}
