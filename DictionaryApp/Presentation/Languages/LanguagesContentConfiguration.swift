//
//  LanguagesContentConfiguration.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 28/02/26.
//

import UIKit

struct LanguagesContentConfiguration: UIContentConfiguration {

    var languageWithWords: LanguageWithWords
    
    func makeContentView() -> any UIView & UIContentView {
        return LanguagesContentView(with: self)
    }
    
    func updated(for state: any UIConfigurationState) -> Self {
        return self
    }
}
