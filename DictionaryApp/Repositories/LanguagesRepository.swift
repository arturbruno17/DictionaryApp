//
//  LanguagesRepository.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 07/02/26.
//

import Foundation

class LanguagesRepository {
    
    private static let baseUrl = "https://freedictionaryapi.com/api/v1"
    
    let urlSesison: URLSession
    let jsonDecoder: JSONDecoder
    
    init(urlSesison: URLSession = .shared, jsonDecoder: JSONDecoder = .init()) {
        self.urlSesison = urlSesison
        self.jsonDecoder = jsonDecoder
    }
    
    func getLanguages() async throws -> [LanguageWithWords] {
        let url = URL(string: "\(Self.baseUrl)/languages")!
        let urlRequest = URLRequest(url: url)
        let (data, _) = try await urlSesison.data(for: urlRequest)
        return try jsonDecoder.decode([LanguageWithWords].self, from: data)
    }
    
    func getWordDetails(for word: String, in language: String) async throws -> EntriesByLanguageAndWord {
        let url = URL(string: "\(Self.baseUrl)/entries/\(language)/\(word)")!
        print(url.absoluteString)
        let urlRequest = URLRequest(url: url)
        let (data, _) = try await urlSesison.data(for: urlRequest)
        return try jsonDecoder.decode(EntriesByLanguageAndWord.self, from: data)
    }
    
}
