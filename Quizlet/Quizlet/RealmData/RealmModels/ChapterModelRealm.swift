//
//  ChapterModelRealm.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import RealmSwift

final class ChapterModelRealm: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var chapterId: Int
    
    convenience init(name: String, chapterId: Int) {
        self.init()
        self.name = name
        self.chapterId = chapterId
    }
}
