//
//  BaseSecureTextField.swift
//
//
//  Created by Данила Бондаренко on 13.04.2024.
//

import SwiftUI

public struct BaseSecureTextField: View {
    @State private var isShowable: Bool = false
    @Binding var text: String
    
    let placeholder: String
    
    public init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    public var body: some View {
        Group {
            if !isShowable {
                secureBody
            } else {
                showableBody
            }
        }
    }
    
    private var secureBody: some View {
        HStack {
            SecureField(
                "",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundStyle(.gray)
            )
            .foregroundStyle(.black)
            
            Spacer()
            
            showableButton
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.white)
        )
        .shadow(radius: 1)
        .frame(height: 64)
    }
    
    private var showableBody: some View {
        HStack {
            TextField(
                "",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundStyle(.gray)
            )
            .foregroundStyle(.black)
            
            Spacer()
            
            showableButton
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.white)
        )
        .shadow(radius: 1)
        .frame(height: 64)
    }
    
    private var showableButton: some View {
        Button(action: {
            isShowable.toggle()
        }, label: {
            Image(systemName: isShowable ? "eye.slash" : "eye")
                .foregroundStyle(.black)
        })
    }
}

#Preview {
    @State var passwordText = ""
    return BaseSecureTextField("Пароль", text: $passwordText)
}
