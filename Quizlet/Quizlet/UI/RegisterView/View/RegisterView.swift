//
//  RegisterView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI
import QuizletRedux
import QuizletCommonUI

struct RegisterView: View {
    @EnvironmentObject var store: Store<AppState>
    @State private var firstNameText = ""
    @State private var userNameText = ""
    @State private var passwordText = ""
    @State private var checkPasswordText = ""

    
    var state: RegisterViewState? { store.publicState.screenState(for: .register) }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack(alignment: .center, spacing: 32) {
                headerView
                fieldsView
                BaseButton(title: "Зарегестрироваться") {
                    store.dispatch(RegisterViewStateAction.register(
                        userName: userNameText,
                        name: firstNameText,
                        password: passwordText,
                        checkPassword: checkPasswordText
                    ))
                }
            }
            .padding(.horizontal)
            
            if let message = state?.errorMessage {
                VStack {
                    makeErrorAlert(message: message)
                    Spacer()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.store.dispatch(RegisterViewStateAction.discardError)
                    }
                }
            }
        }
        .onAppear {
            store.dispatch(ActiveScreensStateAction.showScreen(.register))
        }
        
    }
    
    private var fieldsView: some View {
        VStack(alignment: .center, spacing: 8) {
            BaseTextField("First name", text: $firstNameText)
            BaseTextField("User Name", text: $userNameText)
            BaseSecureTextField("Password", text: $passwordText)
            BaseSecureTextField("Check Password", text: $checkPasswordText)

        }
    }
    
    private var headerView: some View {
        HStack {
            Spacer()
            Text("Регистрация")
                .font(.title2)
                .foregroundStyle(.black)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(store)
}
