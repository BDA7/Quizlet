//
//  QuestionRealmModel.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import RealmSwift

final class QuestionRealmModel: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var correctAnswer: String
    @Persisted var incorrectAnswer: String
    @Persisted var incorrectAnswerTwo: String
    @Persisted var themeName: String
    
    convenience init(title: String, correctAnswer: String, incorrectAnswer: String, incorrectAnswerTwo: String, themeName: String) {
        self.init()
        self.title = title
        self.correctAnswer = correctAnswer
        self.incorrectAnswer = incorrectAnswer
        self.incorrectAnswerTwo = incorrectAnswerTwo
        self.themeName = themeName
    }
}
