//
//  ThemeModelRealm.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import RealmSwift

final class ThemeModelRealm: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var themeId: Int
    @Persisted var chapterId: Int
    
    convenience init(title: String, themeId: Int, chapterId: Int) {
        self.init()
        self.title = title
        self.themeId = themeId
        self.chapterId = chapterId
    }
}
