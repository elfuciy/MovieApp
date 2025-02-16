//
//  DetailCollectionViewModel.swift
//  MovieApp
//
//  Created by Elsever on 13.02.25.
//

import Foundation
import UIKit
enum DetailSections {
    case genre
    case rating
    case director
}

enum Selections {
    case detail
    case trailer
    case cast
    case shots
}

class DetailCellViewModel {
    let detailSections: [DetailSections] = [.genre, .rating, .director]
    let selections: [Selections] = [.detail, .trailer, .cast, .shots]
    
    func createSection(tag: Int) -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionNumber, environment in
            switch self.selections[tag] {
            case .detail:
                switch self.detailSections[sectionNumber] {
                case .genre:
                    CompositionalLayout.createSelection(index: 0)
                case .rating:
                    CompositionalLayout.createSelection(index: 46)
                case .director:
                    CompositionalLayout.createSelection(index: 12)
                }
            case  .trailer, .cast, .shots:
                CompositionalLayout.trailer()
            }
           
        }
    }
    var detailArrayData: DetailModel?
    var network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    
    func getData(id: Int) {
        let path = Detail.detail(id: id).path
        print(path)
        network.request2(endPoint: path, model: DetailModel.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.detailArrayData = data
                self.completion?()
            }
        }
    }
    
    func numberOfCells(section: Int, tag: Int) -> Int {
        switch selections[tag] {
        case .detail:
            switch detailSections[section] {
            case .genre:
                detailArrayData?.genres?.count ?? 0
            case .rating:
                1
            case .director:
                1
            }
        case .trailer:
            1
        case .cast:
            1
        case .shots:
            1
        }
        
    }
    
    func numberOfSections(tag: Int) -> Int {
        switch selections[tag] {
        case .detail:
            3
        case .trailer, .cast, .shots:
            1
        }
    }
    
    
}
