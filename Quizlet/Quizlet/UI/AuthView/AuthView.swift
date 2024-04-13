//
//  AuthView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 13.04.2024.
//

import SwiftUI
import QuizletCommonUI

struct AuthView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(edges: .all)
            
            VStack(alignment: .center, spacing: 32) {
                titleView
                formView
            }
        }
    }
    
    private var titleView: some View {
        HStack {
            Spacer()
            Text("Quizlet")
                .font(.title)
                .foregroundStyle(.black)
                .fontWeight(.bold)
            Spacer()
        }
    }
    
    private var formView: some View {
        VStack(alignment: .center, spacing: 16) {
            textFieldsByFormView
            BaseButton(title: "Войти") {}
        }
    }
    
    private var textFieldsByFormView: some View {
        VStack(alignment: .center, spacing: 8) {
            BaseTextField("Username", text: $userName)
            BaseSecureTextField("Password", text: $password)
        }
    }
}

#Preview {
    AuthView()
}
