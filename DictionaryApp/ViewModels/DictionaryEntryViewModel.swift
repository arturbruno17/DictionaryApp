//
//  DictionaryEntryViewModel.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 10/02/26.
//

import Foundation
import Observation

@MainActor
@Observable
class DictionaryEntryViewModel {
    
    let languagesRepository: LanguagesRepository
    
    init(languagesRepository: LanguagesRepository = LanguagesRepository()) {
        self.languagesRepository = languagesRepository
    }
    
    private(set) var compactedWordDetails: CompactedWordDetails? = nil
    
    func getWordDetails(for word: String, in languageCode: String) {
        Task {
            let entriesByLanguageAndWord = try! await languagesRepository.getWordDetails(for: word, in: languageCode)
            compactedWordDetails = CompactedWordDetails(
                word: entriesByLanguageAndWord.word,
                pronunciations: entriesByLanguageAndWord.entries.flatMap { $0.pronunciations }
                    .filter { !$0.tags.isEmpty },
                forms: entriesByLanguageAndWord.entries.flatMap { $0.forms }
                    .filter { !$0.tags.isEmpty },
                senses: entriesByLanguageAndWord.entries.flatMap { $0.senses },
                synonyms: entriesByLanguageAndWord.entries.flatMap { $0.synonyms },
                antonyms: entriesByLanguageAndWord.entries.flatMap { $0.antonyms },
            )
        }
    }
    
    
}
