//
//  LanguagesViewCell.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 28/02/26.
//

import UIKit

class LanguagesViewCell: UICollectionViewCell {
    
    static let identifier = "LanguagesViewCell"
    
    var languageWithWords: LanguageWithWords?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var newConfiguration = LanguagesContentConfiguration(languageWithWords: .empty())
        if let languageWithWords {
            newConfiguration.languageWithWords = languageWithWords
        }
        contentConfiguration = newConfiguration
    }
}
