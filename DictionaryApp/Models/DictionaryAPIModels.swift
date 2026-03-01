//
//  DictionaryAPIModels.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 07/02/26.
//

import Foundation

struct EntriesByLanguageAndWord: Codable {
    let word: String
    let entries: [Entry]
}

struct Entry: Codable {
    let pronunciations: [Pronunciation]
    let forms: [Form]
    let senses: [Sense]
    let synonyms: [String]
    let antonyms: [String]
}

struct Form: Codable, CustomStringConvertible {
    let word: String
    let tags: [String]
    
    var description: String {
        "\(word): \(tags.joined(separator: ","))"
    }
}

struct LanguageWithWords: Codable {
    let code: String
    let name: String
    let words: UInt32
    
    static func empty() -> Self {
        return Self(code: "", name: "", words: 0)
    }
}

struct Pronunciation: Codable, CustomStringConvertible {
    let type: PronunciationType
    let text: String
    let tags: [String]
    
    var description: String {
        "\(text): \(tags.joined(separator: ","))"
    }
}

enum PronunciationType: String, Codable {
    case ipa
    case enpr
}

struct Sense: Codable {
    let definition: String
    let tags: [String]
    let examples: [String]
    let quotes: [Quote]
    let synonyms: [String]
    let antonyms: [String]
    let subsenses: [Sense]
}

struct Quote: Codable, CustomStringConvertible {
    let text: String
    let reference: String
    
    var description: String {
        "\(text) (\(reference))"
    }
}
