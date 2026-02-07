//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 07/02/26.
//

import UIKit

class ViewController: UIViewController {

    let languagesRepository = LanguagesRepository()
    
    var languagesResponse: [LanguageWithWords]? = nil {
        didSet {
            showResponse()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        Task { languagesResponse = try? await languagesRepository.getLanguages() }
    }

    func showResponse() {
        let frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        let text = UITextView(frame: frame)
        text.textAlignment = .center
        text.text = "\(languagesResponse?.debugDescription ?? "Error loading data")"
        view.addSubview(text)
    }

}

