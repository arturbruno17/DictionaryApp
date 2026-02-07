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
    
    init(urlSesison: URLSession = .shared) {
        self.urlSesison = urlSesison
    }
    
    func getLanguages() async throws -> String? {
        let url = URL(string: "\(Self.baseUrl)/languages")!
        let urlRequest = URLRequest(url: url)
        let (data, urlResponse) = try await urlSesison.data(for: urlRequest)
        return String(data: data, encoding: .utf8)
    }
    
}
