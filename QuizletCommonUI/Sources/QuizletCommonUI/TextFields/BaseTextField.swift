//
//  BaseTextField.swift
//  
//
//  Created by Данила Бондаренко on 13.04.2024.
//

import SwiftUI

public struct BaseTextField: View {
    let placeholder: String
    @Binding var text: String
    
    public init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }

    public var body: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(placeholder)
                .foregroundStyle(.gray)
        )
        .foregroundStyle(.black)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.white)
        )
        .shadow(radius: 1)
        .frame(height: 64)
    }
}

#Preview {
    BaseTextField("ЧТо-то", text: .constant(""))
}
