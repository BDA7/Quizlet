//
//  ThemeCell.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import SwiftUI

struct ThemeCell: View {
    let themeModel: ThemeModel
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(themeModel.title)
                    .foregroundStyle(.black)
                    .font(.title3)
                    .fontWeight(.regular)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24.0)
                .fill(Color.baseCell)
        )
    }
}

#Preview {
    ThemeCell(themeModel: ThemeModel(title: "Темbretbttb tbrvbervervrevrevrevа", themeId: 0, chapterId: 1), action: {})
}
