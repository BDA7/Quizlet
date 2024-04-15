//
//  ProfileModelRealm.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import Foundation
import RealmSwift

final class ProfileModelRealm: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var userName: String
    @Persisted var firstName: String
    @Persisted var password: String
    
    convenience init(userName: String, firstName: String, password: String) {
        self.init()
        self.userName = userName
        self.firstName = firstName
        self.password = password
    }
}
