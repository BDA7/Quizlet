//
//  ThemesDTO.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 16.03.2024.
//

import Foundation

struct ThemesDTO: Codable, Identifiable {
    let id: Int
    let nameTheme: String
    let grade: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nameTheme = "name_theme"
        case grade
    }
}
