//
//  SearchModel.swift
//  MovieApp
//
//  Created by Elsever on 08.02.25.
//

import Foundation

enum SearchEndpoint {
    case query(query: String)
    
    var path: String {
        switch self {
        case .query(let queryString):
            NetworkManager.shared.configureUrl(endPoint: "search/movie?query=\(queryString)")
        }
    }
}


// MARK: - Welcome
struct SearchModel: Codable {
    let page: Int?
    let results: [SearchResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct SearchResult: Codable, SearchProtocol {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    var imageUrl: String {
        posterPath ?? ""
    }
    
    var titleText: String {
        originalTitle ?? ""
    }
    

    var ratingText: Double {
        voteAverage ?? 0
    }
    
//    var genreText: String {
//
//    }
    
    var infoText: String {
        overview ?? ""
    }
    
//    var directorText: String {
//
//    }
    
    var languageText: String {
        originalLanguage ?? ""
    }
    
}
