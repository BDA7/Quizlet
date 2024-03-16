//
//  ProfileView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var store: Store<AppState>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ProfileView()
        .environmentObject(store)
}
