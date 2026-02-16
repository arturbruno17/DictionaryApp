//
//  CompactedWordDetails.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 10/02/26.
//

import Foundation

struct CompactedWordDetails {
    let word: String
    let pronunciations: [Pronunciation]
    let forms: [Form]
    let senses: [Sense]
    let synonyms: [String]
    let antonyms: [String]

    enum Options: String, CaseIterable {
        case senses = "Senses"
        case pronunciations = "Pronunciations"
        case forms = "Forms"
        case synonyms = "Synonyms"
        case antonyms = "Antonyms"
    }

    subscript(option: Options) -> [Any] {
        switch option {
        case .pronunciations:
            return pronunciations
        case .forms:
            return forms
        case .senses:
            return senses
        case .synonyms:
            return synonyms
        case .antonyms:
            return antonyms
        }
    }

}
