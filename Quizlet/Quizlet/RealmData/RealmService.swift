//
//  RealmService.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 14.04.2024.
//

import Foundation
import RealmSwift

final class RealmService {
    private let realmQueue = DispatchQueue(label: "com.Avtoban.RealmService", qos: .utility)
    static let shared = RealmService()
    
    private init() {}
}

extension RealmService {
    func setupBaseModels() {
        [
            ("SwiftUI", 0),
            ("UIKit", 1),
            ("Руководство по Swift", 2),
            ("Разное", 3),
            ("Паттерны", 4),
        ].forEach { addChapter($0.0, chapterId: $0.1) }
        
        [
            ("SwiftUI Essentials", 0, 0),
            ("Drawing and Animation", 1, 0),
            ("Combine", 2, 0),
            ("ViewController Lifecycle", 3, 1),
            ("App Lifecycle", 4, 1),
            ("Bounds And Frame", 5, 1),
            ("UIView", 6, 1),
            ("Auto Layout", 7, 1),
            ("Основы", 8, 2),
            ("Числовые и логические типы", 9, 2),
            ("Базовые операторы", 10, 2),
            ("Операторы Диапазона", 11, 2),
            ("Логические операторы", 12, 2),
            ("Строки и символы", 13, 2),
            ("Коллекции", 14, 2),
            ("Множества", 15, 2),
            ("Словари", 16, 2),
            ("Кортежи", 17, 2),
        ].forEach { addTheme($0.0, themeId: $0.1, chapterId: $0.2)}
        
        [
            ("Какому протоколу соотвествует основная структура проекта, использующего SWiftUI Lifecycle", "App", "AnyObject", "UIApplicationDelegate", 0),
            ("Какой атрибуты структуры определяет точку входа в приложение, использующее SwiftUI Lifecycle", "@main", "@entry", "@initial", 0),
            ("Как в SwiftUI называется контейнер, который определяет свое содержимое как функцию соб", "", "", "", 1),
            ("Как в SwiftUI называется контейнер, который определяет свое содержимое как функцию соб", "", "", "", 1),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 2),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 2),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 3),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 3),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 4),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 4),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 5),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 5),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 6),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 6),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 7),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 7),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 8),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 8),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 9),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 9),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 10),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 10),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 11),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 11),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 12),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 12),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 13),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 13),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 14),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 14),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 15),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 15),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 16),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 16),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 17),
            ("Question", "Correct Answer", "Incorect", "Incorrect", 17),

        ].forEach { addQuestion($0.0, correctAnswer: $0.1, incorrectAnswer: $0.2, incorrectAnswerTwo: $0.3, themeId: $0.4) }
    }
    
    func setupBaseSettings() {
        setupBaseModels()
        setupBaseProfiles()
    }
    
    func setupBaseProfiles() {
        [
            ProfileModel(userName: "danyxw", firstName: "Danila", password: "123"),
            ProfileModel(userName: "anich", firstName: "Anna", password: "1234"),
            ProfileModel(userName: "EVDOKIM", firstName: "Ivan", password: "123"),
            ProfileModel(userName: "milk_barbie", firstName: "Maria", password: "123"),
            ProfileModel(userName: "ganys_german", firstName: "German", password: "1234556"),
        ].forEach { addProfile(profileModel: $0)}
    }
}

extension RealmService {
    func addChapter(_ chapterName: String, chapterId: Int) {
        realmQueue.async { [weak self] in
            guard let self = self, let realm = try? Realm(configuration: .init(deleteRealmIfMigrationNeeded: true), queue: self.realmQueue) else { return }
            
            let findingModels = realm.objects(ChapterModelRealm.self)
                .filter { $0.name == chapterName && $0.chapterId == chapterId }
            
            if findingModels.count > 0 {
                return
            }
            
            let realmModel = ChapterModelRealm(name: chapterName, chapterId: chapterId)
            
            try? realm.write({
                realm.add(realmModel)
            })
        }
    }
    
    func addTheme(_ themeName: String, themeId: Int, chapterId: Int) {
        realmQueue.async { [weak self] in
            guard let self = self, let realm = try? Realm(configuration: .init(deleteRealmIfMigrationNeeded: true), queue: self.realmQueue) else { return }
            
            let findingModels = realm.objects(ThemeModelRealm.self)
                .filter { $0.themeId == themeId && $0.title == themeName && $0.chapterId == chapterId }
            
            if findingModels.count > 0 {
                return
            }
            
            let realmModel = ThemeModelRealm(title: themeName, themeId: themeId, chapterId: chapterId)
            
            try? realm.write({
                realm.add(realmModel)
            })
        }
    }
    
    func addQuestion(_ title: String, correctAnswer: String, incorrectAnswer: String, incorrectAnswerTwo: String, themeId: Int) {
        realmQueue.async { [weak self] in
            guard let self = self, let realm = try? Realm(configuration: .init(deleteRealmIfMigrationNeeded: true), queue: self.realmQueue) else { return }
            
            let findingModels = realm.objects(QuestionRealmModel.self)
                .filter { 
                    $0.title == title && $0.correctAnswer == correctAnswer &&
                    $0.incorrectAnswer == incorrectAnswer && $0.themeId == themeId
                }
            
            if findingModels.count > 0 {
                return
            }
            
            let realmModel = QuestionRealmModel(
                title: title, correctAnswer: correctAnswer,
                incorrectAnswer: incorrectAnswer, incorrectAnswerTwo: incorrectAnswerTwo,
                themeId: themeId
            )
            
            try? realm.write({
                realm.add(realmModel)
            })
        }
    }
    
    func getQuestions(_ themeId: Int, _ completion: @escaping ([QuestionModel]) -> Void) {
        realmQueue.async { [weak self] in
            guard let self = self, let realm = try? Realm(configuration: .init(deleteRealmIfMigrationNeeded: true), queue: self.realmQueue) else { return }
            
            let findingRealmModels = realm.objects(QuestionRealmModel.self)
                .filter({$0.themeId == themeId })
            
            var resultArr: [QuestionModel] = []
            
            findingRealmModels.forEach {
                resultArr.append(
                    QuestionModel(
                        title: $0.title, correctAnswer: $0.correctAnswer,
                        incorrectAnswer: $0.incorrectAnswer, incorrectAnswerTwo: $0.incorrectAnswerTwo,
                        themeId: $0.themeId
                    )
                )
            }
            
            completion(resultArr)
        }
    }
    
    func getChapters(_ completion: @escaping ([ChapterModel]) -> Void) {
        realmQueue.async { [weak self] in
            guard let self = self, let realm = try? Realm(configuration: .init(deleteRealmIfMigrationNeeded: true), queue: self.realmQueue) else { return }
            let findingRealmModels = realm.objects(ChapterModelRealm.self)
            
            var resultArr: [ChapterModel] = []
            
            findingRealmModels.forEach {
                resultArr.append(ChapterModel(name: $0.name, chapterId: $0.chapterId))
            }
            
            completion(resultArr)
        }
    }
    
    func getThemesByChapter(_ completion: @escaping ([ThemeModel]) -> Void) {
        realmQueue.async { [weak self] in
            guard let self = self, let realm = try? Realm(configuration: .init(deleteRealmIfMigrationNeeded: true), queue: self.realmQueue) else { return }
            let findingRealmModels = realm.objects(ThemeModelRealm.self)
            
            var resultArr: [ThemeModel] = []
            
            findingRealmModels.forEach {
                resultArr.append(ThemeModel(title: $0.title, themeId: $0.themeId, chapterId: $0.chapterId))
            }
            
            completion(resultArr)
        }
    }
}


extension RealmService {
    func addProfile(profileModel: ProfileModel) {
        realmQueue.async { [weak self] in
            guard let self = self, let realm = try? Realm(configuration: .init(deleteRealmIfMigrationNeeded: true), queue: self.realmQueue) else { return }
            
            let findingRealmModels = realm.objects(ProfileModelRealm.self)
                .filter { $0.userName == profileModel.userName }
            
            if findingRealmModels.count > 0 {
                return
            }
            
            let realmModel = ProfileModelRealm(userName: profileModel.userName, firstName: profileModel.firstName, password: profileModel.password)
            
            try? realm.write({
                realm.add(realmModel)
            })
        }
    }
    
    func getProfile(userName: String, password: String, _ completion: @escaping (ProfileModel?) -> Void) {
        realmQueue.async { [weak self] in
            guard let self = self, let realm = try? Realm(configuration: .init(deleteRealmIfMigrationNeeded: true), queue: self.realmQueue) else { return }
            
            guard 
                let findingRealmModels = realm.objects(ProfileModelRealm.self).filter({ $0.userName == userName }).first else {
                    completion(nil)
                    return
                }
            
            if findingRealmModels.password == password {
                let profileModel = ProfileModel(userName: findingRealmModels.userName, firstName: findingRealmModels.firstName, password: findingRealmModels.password)
                completion(profileModel)
            }
            
            completion(nil)
        }
    }
}
