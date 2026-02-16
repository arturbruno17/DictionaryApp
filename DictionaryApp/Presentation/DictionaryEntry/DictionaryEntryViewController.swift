//
//  DictionaryEntryViewController.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 08/02/26.
//

import UIKit

class DictionaryEntryViewController: UIViewController, UITextFieldDelegate {

    // MARK: Data
    private let languageName: String
    private let languageCode: String
    
    init(languageName: String, languageCode: String) {
        self.languageName = languageName
        self.languageCode = languageCode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ViewModel
    private let dictionaryEntryViewModel = DictionaryEntryViewModel()
    
    // MARK: Views
    private let searchView: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type a word"
        textField.backgroundColor = .systemGroupedBackground
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.systemGroupedBackground.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let searchedWordView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .extraLargeTitle)
        return label
    }()
    
    private var wordDetailsView: DictionaryEntryTableView? = nil
    
    func trackViewModel() {
        withObservationTracking {
            guard let compactedWordDetails = self.dictionaryEntryViewModel.compactedWordDetails else { return }
            self.searchedWordView.text = compactedWordDetails.word
            self.showWordDetails(compactedWordDetails)
        } onChange: { [weak self] in
            Task { @MainActor in
                self?.trackViewModel()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Search for \(languageName.lowercased()) words"
        view.backgroundColor = .systemBackground
    
        // Do any additional setup after loading the view.
        view.addSubview(searchView)
        view.addSubview(searchedWordView)
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            searchView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            searchedWordView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 16),
            searchedWordView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            searchedWordView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
        searchView.delegate = self
        makeTrailingIconForTextView()
        trackViewModel()
    }
    
    func makeTrailingIconForTextView() {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(
            systemName: "magnifyingglass",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16)
        )
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 6)
        let button = UIButton(configuration: config)
        button.tintColor = .secondaryLabel
        button.addTarget(self, action: #selector(searchWord), for: .touchUpInside)
        searchView.rightView = button
        searchView.rightViewMode = .always
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchWord(sender: textField)
        return true
    }
    
    @objc func searchWord(sender: UIView) {
        guard let text = searchView.text else { return }
        Task { dictionaryEntryViewModel.getWordDetails(for: text, in: languageCode) }
    }
    
    func showWordDetails(_ compactedWordDetails: CompactedWordDetails) {
        if let wordDetailsView {
            wordDetailsView.compactedWordDetails = compactedWordDetails
        } else {
            wordDetailsView = DictionaryEntryTableView(compactedWordDetails: compactedWordDetails)
            wordDetailsView?.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(wordDetailsView!)
            NSLayoutConstraint.activate([
                wordDetailsView!.topAnchor.constraint(equalTo: searchedWordView.bottomAnchor, constant: 16),
                wordDetailsView!.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                wordDetailsView!.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                wordDetailsView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        }
    }
}
