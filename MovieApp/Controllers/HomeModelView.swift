//
//  HomeModelView.swift
//  MovieApp
//
//  Created by Elsever on 01.02.25.
//

import Foundation
import UIKit

enum Sections {
    case popular
    case heading
    case trending
    case upcoming
}
class HomeModelView {
    let sections: [Sections] = [.heading, .popular, .heading, .trending, .heading, .upcoming]
    
    func createSecton(section: Int) -> NSCollectionLayoutSection {
        switch sections[section] {
        case .popular, .trending, .upcoming:
            CompositionalLayout.createMovies()
        case .heading:
            CompositionalLayout.createHeading()
        }
    }
    
    func itemNumber(section: Int) -> Int {
        switch sections[section] {
        case .heading:
            return 1
        case .popular, .trending, .upcoming:
            return 10
        }
    }
}
