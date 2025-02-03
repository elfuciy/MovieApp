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

struct HomeModel {
    let title: String
    let item: [MovieResult]
}

class HomeModelView {
    
    let sections: [Sections] = [.heading, .popular, .heading, .trending, .heading, .nowPlaying, .heading, .upcoming]
    var movies: [Movie] = []
    var movieItems: [HomeModel] = []
    
    let network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    
    var count: Int = 0
    
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
    
    func getAllData() {
        getNowPlaying()
        getPopular()
        getUpcoming()
        getTopRated()
    }
    
    func getNowPlaying() {
        network.request2(endPoint: .nowPlaying, model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems.append(.init(title: "NowPlaying", item: data.results ?? [] ))
                self.completion?()
            }
        }
    }
    
    func getPopular() {
        network.request2(endPoint: .popular, model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems.append(.init(title: "Popular", item: data.results ?? [] ))
                self.completion?()
            }
        }
    }
    
    func getUpcoming() {
        network.request2(endPoint: .upcoming, model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems.append(.init(title: "Upcoming", item: data.results ?? [] ))
                self.completion?()
            }
        }
    }
    
    func getTopRated() {
        network.request2(endPoint: .topRated, model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems.append(.init(title: "TopRated", item: data.results ?? [] ))
                self.completion?()
            }
        }
    }
}
