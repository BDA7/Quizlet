//
//  ContentView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 13.04.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            Button(action: {
                viewModel.checkPAckage()
            }, label: {
                Text("check package")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
