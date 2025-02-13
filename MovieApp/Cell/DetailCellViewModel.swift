//
//  DetailCollectionViewModel.swift
//  MovieApp
//
//  Created by Elsever on 13.02.25.
//

import Foundation
import UIKit
enum DetailSections {
    case selection
    case info
}
class DetailCellViewModel {
    let detailSections: [DetailSections] = [.selection, .info]
    
    func createSection() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionNumber, environment in
            switch self.detailSections[sectionNumber] {
            case .selection:
                CompositionalLayout.createSelection()
            case .info:
                CompositionalLayout.createHeading()
            }
        }
    }
}
