//
//  CompositionalView.swift
//  MovieApp
//
//  Created by Elsever on 01.02.25.
//

import Foundation
import UIKit

class CompositionalLayout {
    
    static func createHeading() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 28, bottom: 0, trailing: 12)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    static func createMovies() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(167), heightDimension: .absolute(240)), subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
}
