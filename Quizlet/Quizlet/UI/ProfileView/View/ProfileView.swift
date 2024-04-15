//
//  ProfileView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import SwiftUI
import QuizletRedux

struct ProfileView: View {
    @EnvironmentObject var store: Store<AppState>
    
    var state: ProfileViewState? { store.publicState.screenState(for: .profile) }

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            
            VStack(spacing: 16) {
                imageUserView
                firstNameView
                userNameView
                
                if let results = state?.results {
                    ThemesResultsChart(resultsModels: results)
                } else {
                    Text("Not found results")
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
        .onAppear {
            store.dispatch(ActiveScreensStateAction.showScreen(.profile))
            store.dispatch(ProfileViewStateAction.fetchProfile)
            store.dispatch(ProfileViewStateAction.fetchResults)
        }
    }
    
    private var imageUserView: some View {
        Image("profileDefaultImage")
            .foregroundStyle(
                .black.gradient
                .shadow(.inner(color: .white.opacity(0.3), radius: 5, x: -10, y: -100))
            )
    }
    
    private var userNameView: some View {
        HStack {
            Text("@\(state?.profileModel?.userName ?? "No User Name")")
                .foregroundStyle(.gray)
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var firstNameView: some View {
        HStack {
            Text(state?.profileModel?.firstName ?? "No First Name")
                .foregroundStyle(.black)
                .font(.title)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
        .environmentObject(store)
}
