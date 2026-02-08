//
//  LanguagesViewController+CompositionalLayout.swift
//  DictionaryApp
//
//  Created by Artur Bruno on 07/02/26.
//

import UIKit

extension LanguagesViewController {
    static func makeLayout() -> UICollectionViewCompositionalLayout {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .uniformAcrossSiblings(estimate: 120)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(120)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(16)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)

        return UICollectionViewCompositionalLayout(section: section)
    }

}
