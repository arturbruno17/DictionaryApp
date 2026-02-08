//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 07/02/26.
//

import UIKit

class LanguagesViewController: UICollectionViewController {

    // MARK: View controller repositories
    let languagesRepository = LanguagesRepository()
    
    // MARK: View controller data
    var languagesResponse: [LanguageWithWords]? = nil {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init() {    
        super.init(collectionViewLayout: LanguagesViewController.makeLayout())
        
        collectionView.register(LanguagesViewCell.self, forCellWithReuseIdentifier: LanguagesViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Choose the language"
        
        view.backgroundColor = .systemBackground
        Task {
            languagesResponse = try? await languagesRepository.getLanguages()
                .sorted { $0.name <= $1.name }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        languagesResponse?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LanguagesViewCell.identifier, for: indexPath) as! LanguagesViewCell
        let index = indexPath.row
        let languageWithWords = languagesResponse![index]
        cell.configure(languageWithWords: languageWithWords)
        return cell
    }
}

