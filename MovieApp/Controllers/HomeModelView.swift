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

struct HomeModel {
    let title: String
    let item: [MovieResult]
}

class HomeModelView {
    
    let sections: [Sections] = [.heading, .popular, .heading, .trending, .heading, .upcoming]
    var movies: [Movie] = []
    var movieItems: [HomeModel] = []
    
    let network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    
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
            return movieItems.count
        }
    }
    
    func getAllData() {
        getNowPlaying()
        getPopular()
        getUpcoming()
//        getTopRated()
        print(movieItems)
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
