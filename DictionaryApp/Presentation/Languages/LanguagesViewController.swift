//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 07/02/26.
//

import UIKit

class LanguagesViewController: UICollectionViewController {

    // MARK: View controller repositories
    private let languagesRepository = LanguagesRepository()
    
    // MARK: View controller data
    private var languagesResponse: [LanguageWithWords]? = nil {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init(repository: LanguagesRepository = LanguagesRepository()) {
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
            // TODO: Handle failure cases
            languagesResponse = try? await languagesRepository.getLanguages()
                .sorted { $0.name <= $1.name }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        languagesResponse?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LanguagesViewCell.identifier,
            for: indexPath
        ) as! LanguagesViewCell
        cell.languageWithWords = languagesResponse![indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        let languageWithWords = languagesResponse![index]
        let vc = DictionaryEntryViewController(
            languageName: languageWithWords.name,
            languageCode: languageWithWords.code
        )
        navigationController?.pushViewController(vc, animated: true)
    }
}

