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
    
    // MARK: Views
    private let textFieldView: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type a word"
        textField.backgroundColor = .systemGroupedBackground
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.systemGroupedBackground.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    init(languageName: String) {
        self.languageName = languageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Search for \(languageName.lowercased()) words"
        view.backgroundColor = .systemBackground
        
        // Do any additional setup after loading the view.
        view.addSubview(textFieldView)
        NSLayoutConstraint.activate([
            textFieldView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            textFieldView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textFieldView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
        textFieldView.delegate = self
        makeTrailingIconForTextView()
    }
    
    func makeTrailingIconForTextView() {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .secondaryLabel
        
        button.addTarget(self, action: #selector(searchWord), for: .touchUpInside)
        
        textFieldView.rightView = button
        textFieldView.rightViewMode = .always
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchWord(sender: textField)
        return true
    }
    
    @objc func searchWord(sender: UIView) {
        
    }
    
    
}
