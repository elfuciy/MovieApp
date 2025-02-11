//
//  MovieEndPoint.swift
//  MovieApp
//
//  Created by Elsever on 07.02.25.
//

import Foundation

enum DataEndPoints: CaseIterable {
    case nowPlaying
    case popular
    case topRated
    case upcoming
    
    
    var path: String {
        switch self {
        case .nowPlaying:
            NetworkManager.shared.configureUrl(endPoint: "movie/now_playing")
        case .popular:
            NetworkManager.shared.configureUrl(endPoint: "movie/popular")
        case .topRated:
            NetworkManager.shared.configureUrl(endPoint: "movie/top_rated")
        case .upcoming:
            NetworkManager.shared.configureUrl(endPoint: "movie/upcoming")
        }
    }
}
    
    enum SearchEndpoint {
        case query(query: String)
        
        var path: String {
            switch self {
            case .query(let queryString):
                NetworkManager.shared.configureUrl(endPoint: "search/movie?query=\(queryString)")
            }
        }
    }
    
    enum ActorEndpoint  {
        case actor
        case actorMovieCredits(id: Int)
        
        var path: String {
            switch self {
            case .actor:
                NetworkManager.shared.configureUrl(endPoint: "person/popular")
            case .actorMovieCredits(let id):
                NetworkManager.shared.configureUrl(endPoint: "person/\(id)/movie_credits")
            }
        }
    }
