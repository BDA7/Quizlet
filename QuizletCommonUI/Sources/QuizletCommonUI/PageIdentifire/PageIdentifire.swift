//
//  SwiftUIView.swift
//  
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import SwiftUI

public struct PageIdentifier: View {
    let percentage: CGFloat
    
    public init(percentage: CGFloat) {
        self.percentage = percentage
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: geometry.size.height / 2)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color.gray.opacity(0.3))
                
                Rectangle()
                    .frame(width: geometry.size.width * percentage, height: geometry.size.height)
                    .foregroundColor(.orange)
                    .animation(.easeInOut(duration: 0.5)) // Анимация изменения ширины прямоугольника
            }
        }
        .frame(height: 10)
    }
}

#Preview {
    PageIdentifier(percentage: 0.25)
}
