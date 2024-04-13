//
//  BaseButton.swift
//
//
//  Created by Данила Бондаренко on 13.04.2024.
//

import SwiftUI

public struct BaseButton: View {
    let action: () -> Void
    let title: String
    
    public init(title: String, _ action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    public var body: some View {
        Button(
            action: {action()},
            label: {
                HStack(alignment: .center) {
                    Spacer()
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }
        )
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.orange)
        )
        .frame(height: 64)
    }
}

#Preview {
    BaseButton(title: "что-то", {})
}
