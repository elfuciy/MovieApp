//
//  HomeModelView.swift
//  MovieApp
//
//  Created by Elsever on 01.02.25.
//

import Foundation
import UIKit

enum Sections: String {
    case popular = "Popular"
    case heading
    case trending = "TopRated"
    case upcoming = "Upcoming"
    case nowPlaying = "NowPlaying"
}

struct MovieStruct {
    let title: Sections
    let endpoint: MovieEndPoint
}

struct HomeModel {
    let title: String
    let item: [MovieResult]
}

class HomeModelView {
    
    let movieStruct: [MovieStruct] = [.init(title: .popular, endpoint: .popular),
                                      .init(title: .trending, endpoint: .topRated),
                                      .init(title: .upcoming, endpoint: .upcoming),
                                      .init(title: .nowPlaying, endpoint: .nowPlaying)]
    
    let sections: [Sections] = [.heading, .popular, .heading, .trending, .heading, .nowPlaying, .heading, .upcoming]
    var movies: [Movie] = []
    var movieItems: [HomeModel] = []
    
    let network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    var path = ""
        
    func createSecton() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionNumber, environment in
            switch self.sections[sectionNumber] {
            case .popular, .trending, .upcoming, .nowPlaying:
                CompositionalLayout.createMovies()
            case .heading:
                CompositionalLayout.createHeading()
            }
        }
    }
    
    func itemNumber(section: Int) -> Int {
        switch sections[section] {
        case .heading:
            return 1
        case .popular, .trending, .upcoming, .nowPlaying:
            return movieItems.filter({$0.title == sections[section].rawValue}).first?.item.count ?? 0
        }
    }
    
//    func getAllData() {
//        getNowPlaying()
//        getPopular()
//        getUpcoming()
//        getTopRated()
//    }
    
    func getPlaying() {
        for item in  MovieEndPoint.allCases {
            self.path = item.path
            self.network.request2(endPoint: self.path, model: Movie.self) { data, error in
                if let error {
                    self.errorHandler?(error)
                } else if let data {
                    self.movieItems.append(.init(title: self.movieStruct.filter({$0.endpoint == item}).first?.title.rawValue ?? "", item: data.results ?? [] ))
                    self.completion?()
                }
            }
        }
    }
//    
//    func getNowPlaying() {
//        let path = MovieEndPoint.nowPlaying.path
//        network.request2(endPoint: path, model: Movie.self) { data, error in
//            if let error {
//                self.errorHandler?(error)
//            } else if let data {
//                self.movieItems.append(.init(title: "NowPlaying", item: data.results ?? [] ))
//                self.completion?()
//            }
//        }
//    }
//    
//    func getPopular() {
//        let path = MovieEndPoint.popular.path
//        network.request2(endPoint: path, model: Movie.self) { data, error in
//            if let error {
//                self.errorHandler?(error)
//            } else if let data {
//                self.movieItems.append(.init(title: "Popular", item: data.results ?? [] ))
//                self.completion?()
//            }
//        }
//    }
//    
//    func getUpcoming() {
//        let path = MovieEndPoint.upcoming.path
//        network.request2(endPoint: path, model: Movie.self) { data, error in
//            if let error {
//                self.errorHandler?(error)
//            } else if let data {
//                self.movieItems.append(.init(title: "Upcoming", item: data.results ?? [] ))
//                self.completion?()
//            }
//        }
//    }
//    
//    func getTopRated() {
//        let path = MovieEndPoint.topRated.path
//        network.request2(endPoint: path, model: Movie.self) { data, error in
//            if let error {
//                self.errorHandler?(error)
//            } else if let data {
//                self.movieItems.append(.init(title: "TopRated", item: data.results ?? [] ))
//                self.completion?()
//            }
//        }
//    }
}
