//
//  BaseNetworkService.swift
//
//
//  Created by Данила Бондаренко on 13.04.2024.
//

import Foundation

public final class BaseNetworkService {
    private init() {}
    static public let shared = BaseNetworkService()
    
    public func helloPackage() -> String {
        return "Hello Package"
    }
    
    public func testReadFile() -> PersonName? {
        return loadJson(fileName: "QuestionsSection")
    }
}

extension BaseNetworkService {
    private func loadJson(fileName: String) -> PersonName? {
        let bundle = Bundle.module
        
        if let url = bundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PersonName.self, from: data)
                return jsonData
            } catch {
                return PersonName(name: nil, error: error.localizedDescription)
            }
        }
        
        return nil
    }
    
    public struct PersonName: Decodable {
        let name: String?
        let error: String?
    }
}
