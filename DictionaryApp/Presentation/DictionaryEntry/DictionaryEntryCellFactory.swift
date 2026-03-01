//
//  DicitionaryEntryCellFactory.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 15/02/26.
//

import UIKit

extension UITableViewCell {
    @objc class var identifier: String { "UITableViewCell" }
}

class DictionaryEntryCellFactory {
    static func make(_ tableView: UITableView, for item: Any, at indexPath: IndexPath) -> UITableViewCell {
        if let sense = item as? Sense {
            let cell = tableView.dequeueReusableCell(withIdentifier: SenseTableViewCell.identifier, for: indexPath) as! SenseTableViewCell
            cell.configure(sense: sense)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
            var configuration = cell.defaultContentConfiguration()
            configuration.text = String(describing: item)
            cell.contentConfiguration = configuration
            return cell
        }
    }
}
