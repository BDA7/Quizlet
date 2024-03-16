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
    
    var body: some View {
        Text("Home")
    }
}

#Preview {
    HomeView()
}
