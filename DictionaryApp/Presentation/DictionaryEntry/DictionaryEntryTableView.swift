//
//  DictionaryEntryTableView.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 10/02/26.
//

import UIKit

class DictionaryEntryTableView : UITableView, UITableViewDataSource, UITableViewDelegate {
    var compactedWordDetails: CompactedWordDetails {
        didSet { reloadData() }
    }
    
    init(compactedWordDetails: CompactedWordDetails, style: UITableView.Style = .grouped, frame: CGRect = .zero) {
        self.compactedWordDetails = compactedWordDetails
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
        register(UITableViewHeaderFooterView.self,
                     forHeaderFooterViewReuseIdentifier: "Header")
        register(SenseTableViewCell.self, forCellReuseIdentifier: SenseTableViewCell.identifier)
        register(UITableViewCell.self, forCellReuseIdentifier: "General")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        CompactedWordDetails.Options.allCases.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")!
        
        var contentConfiguration = header.defaultContentConfiguration()
        contentConfiguration.text = CompactedWordDetails.Options.allCases[section].rawValue
        header.contentConfiguration = contentConfiguration
        
        let backgroundConfiguration = header.defaultBackgroundConfiguration()
        header.backgroundConfiguration = backgroundConfiguration
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        compactedWordDetails[CompactedWordDetails.Options.allCases[section]].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = CompactedWordDetails.Options.allCases[indexPath.section]
        let item = compactedWordDetails[section][indexPath.row]
        
        let cell = DictionaryEntryCellFactory.make(tableView, for: item, at: indexPath)
        return cell
    }
}
    
