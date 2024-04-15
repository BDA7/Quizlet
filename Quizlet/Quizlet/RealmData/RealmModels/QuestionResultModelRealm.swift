//
//  QuestionResultModelRealm.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation
import RealmSwift

final class QuestionResultModelRealm: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var finalScore: Float
    @Persisted var themeId: Int
    @Persisted var userName: String
    
    convenience init(finalScore: Float, themeId: Int, userName: String) {
        self.init()
        self.finalScore = finalScore
        self.themeId = themeId
        self.userName = userName
    }
}
