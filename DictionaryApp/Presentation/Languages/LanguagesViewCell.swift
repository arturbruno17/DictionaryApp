//
//  LanguagesViewCell.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 07/02/26.
//

import UIKit

class LanguagesViewCell: UICollectionViewCell {

    static let identifier = "LanguagesViewCell"

    private let stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
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

        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor.copy(alpha: 0.3)

        contentView.addSubview(stackView)
        setupConstraints()
        
        stackView.addArrangedSubview(languageNameView)
        stackView.setCustomSpacing(20, after: languageNameView)
        stackView.addArrangedSubview(languageCodeView)
        stackView.setCustomSpacing(4, after: languageCodeView)
        stackView.addArrangedSubview(wordsCountView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
        ])
    }

    func configure(languageWithWords: LanguageWithWords) {
        languageNameView.text = languageWithWords.name
        languageCodeView.text = languageWithWords.code.uppercased()
        wordsCountView.text = "Words amount: \(languageWithWords.words)"
    }
}
