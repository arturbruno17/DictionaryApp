//
//  LanguagesContentView.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 28/02/26.
//

import UIKit

class LanguagesContentView: UIView, UIContentView {

    var configuration: UIContentConfiguration {
        didSet {
            apply(configuration: configuration)
        }
    }

    private let stackView = UIStackView()
    private let languageNameLabel = UILabel()
    private let languageCodeLabel = UILabel()
    private let wordsCountLabel = UILabel()

    init(with configuration: LanguagesContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        setupViews()
        apply(configuration: configuration)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .systemGroupedBackground
        layer.cornerRadius = 8
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor.copy(alpha: 0.3)
        
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        languageNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        languageNameLabel.numberOfLines = 2
        languageNameLabel.textAlignment = .center

        languageCodeLabel.font = .systemFont(ofSize: 14, weight: .light)
        wordsCountLabel.font = .systemFont(ofSize: 12)

        stackView.addArrangedSubview(languageNameLabel)
        stackView.setCustomSpacing(20, after: languageNameLabel)
        stackView.addArrangedSubview(languageCodeLabel)
        stackView.setCustomSpacing(4, after: languageCodeLabel)
        stackView.addArrangedSubview(wordsCountLabel)

        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    private func apply(configuration: UIContentConfiguration) {
        guard let config = configuration as? LanguagesContentConfiguration else { return }
        languageNameLabel.text = config.languageWithWords.name
        languageCodeLabel.text = config.languageWithWords.code.uppercased()
        wordsCountLabel.text = "Words amount: \(config.languageWithWords.words)"
    }
}
