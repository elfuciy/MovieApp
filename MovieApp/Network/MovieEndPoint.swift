//
//  MovieEndPoint.swift
//  MovieApp
//
//  Created by Elsever on 07.02.25.
//

import Foundation

enum MovieEndPoint: String, CaseIterable {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    
    
    var path: String {
        NetworkManager.shared.configureUrl(endPoint: self.rawValue)
    }
}
