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
    let source: Source
}

struct Entry: Codable {
    let language: Language
    let partOfSpeech: String
    let pronunciations: [Pronunciation]
    let forms: [Form]
    let senses: [Sense]
    let synonyms: [String]
    let antonyms: [String]
}

struct Form: Codable {
    let word: String
    let tags: [String]
}

struct Language: Codable {
    let code: String
    let name: String
}

struct LanguageWithWords: Codable {
    let code: String
    let name: String
    let words: UInt32
}

struct Pronunciation: Codable {
    let type: PronunciationType
    let text: String
    let tags: [String]
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
    let translations: [Translation]?
    let subsenses: [Sense]
}

struct Quote: Codable {
    let text: String
    let reference: String
}

struct Translation: Codable {
    let language: Language
    let word: String
}

struct Source: Codable {
    let url: String
    let license: License
}

struct License: Codable {
    let name: String
    let url: String
}
