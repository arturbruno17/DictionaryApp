//
//  DicitionaryEntryCellFactory.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 15/02/26.
//

import UIKit

class DictionaryEntryCellFactory {
    static func make(_ tableView: UITableView, for item: Any, at indexPath: IndexPath) -> UITableViewCell {
        if let sense = item as? Sense {
            let cell = tableView.dequeueReusableCell(withIdentifier: SenseTableViewCell.identifier, for: indexPath) as! SenseTableViewCell
            cell.configure(sense: sense)
            return cell
        }
            
        let text: String
        switch (item) {
        case let pronunciation as Pronunciation:
            text = "\(pronunciation.text): \(pronunciation.tags.joined(separator: ","))"
            break
        case let form as Form:
            text = "\(form.word): \(form.tags.joined(separator: ","))"
            break
        default:
            text = "\(item)"
            break
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "General", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = text
        cell.contentConfiguration = configuration
        return cell
    }
}
