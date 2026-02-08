//
//  LanguagesViewCell.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 07/02/26.
//

import UIKit

class LanguagesViewCell: UICollectionViewCell {

    static let identifier = "LanguagesViewCell"

    private let languageNameView: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let languageCodeView: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let wordsCountView: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .systemGroupedBackground
        contentView.layer.cornerRadius = 8

        contentView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor.copy(alpha: 0.3)

        contentView.addSubview(languageNameView)
        contentView.addSubview(languageCodeView)
        contentView.addSubview(wordsCountView)

        let margins = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            languageNameView.topAnchor.constraint(equalTo: margins.topAnchor),
            languageNameView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            languageNameView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),

            languageCodeView.topAnchor.constraint(equalTo: languageNameView.bottomAnchor, constant: 20),
            languageCodeView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            languageCodeView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),

            wordsCountView.topAnchor.constraint(equalTo: languageCodeView.bottomAnchor, constant: 4),
            wordsCountView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            wordsCountView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            wordsCountView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(languageWithWords: LanguageWithWords) {
        languageNameView.text = languageWithWords.name
        languageCodeView.text = languageWithWords.code.uppercased()
        wordsCountView.text = "Words amount: \(languageWithWords.words)"
    }
}
