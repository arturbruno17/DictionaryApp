//
//  SenseTableViewCell.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 15/02/26.
//

import UIKit

class SenseTableViewCell: UITableViewCell {

    override class var identifier: String { "SenseTableViewCell" }
    
    let definitionView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let quotesAndExamplesView: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(definitionView)
        contentView.addSubview(quotesAndExamplesView)

        NSLayoutConstraint.activate([
            definitionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            definitionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            definitionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            quotesAndExamplesView.topAnchor.constraint(equalTo: definitionView.bottomAnchor, constant: 8),
            quotesAndExamplesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            quotesAndExamplesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            quotesAndExamplesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(sense: Sense) {
        definitionView.text = sense.definition
        quotesAndExamplesView.text =
            (sense.examples + sense.quotes.map { $0.description })
                .joined(separator: "\n\n")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
