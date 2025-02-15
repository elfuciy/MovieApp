//
//  File.swift
//  MovieApp
//
//  Created by Elsever on 09.02.25.
//

import Foundation

protocol MovieCellProtocol {
    var imageUrl: String { get }
    var titleText: String { get }
}

protocol DetailProtocol {
    var imageUrl: String { get }
    var titleText: String { get }
    var ratingText: Double { get }
//    var genreText: String { get }
    var infoText: String { get }
//    var directorText: String { get }
    var languageText: String { get }
    var movieid: Int { get }
}
