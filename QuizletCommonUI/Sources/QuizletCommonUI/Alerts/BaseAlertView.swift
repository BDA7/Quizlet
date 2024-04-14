//
//  BaseAlertView.swift
//
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI

public func makeErrorAlert(message: String, action: @escaping () -> Void) -> some View {
    return VStack {
        HStack {
            Spacer()
            Text(message)
                .foregroundStyle(.white)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.red)
        )
        .transition(.scale)
        .padding(.horizontal)
        Spacer()
    }
    .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            action()
        }
    }
}
