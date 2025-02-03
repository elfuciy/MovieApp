//
//  ListViewModel.swift
//  MovieApp
//
//  Created by Elsever on 03.02.25.
//

import Foundation
import UIKit

struct MovieStruct {
    let title: String
    let endpoint: EndPoint
}
class ExtendedListViewModel {
    
    var movies: [Movie] = []
    var movieItems: [MovieResult] = []
    var fileteredData: [MovieResult] = []
    
    let network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    
    var isSearched: Bool = false
    
    let movieStruct: [MovieStruct] = [.init(title: "Popular", endpoint: .popular),
                                      .init(title: "TopRated", endpoint: .topRated),
                                      .init(title: "NowPlaying", endpoint: .nowPlaying),
                                      .init(title: "Upcoming", endpoint: .upcoming)]
    
    func searchBarFunc(searchBar: String, collectionView: UICollectionView) {
        if searchBar != "" {
            fileteredData = movieItems.filter{ $0.originalTitle!.lowercased().contains(searchBar)}
            collectionView.reloadData()
            isSearched = true
        } else {
            isSearched = false
            collectionView.reloadData()
        }
    }

    func numberOfItems() -> Int {
            if isSearched {
                print(fileteredData.count)
                return fileteredData.count
            } else {
                return movieItems.count
            }
    }
    
    func getData(endpoint: String? = nil) {
        network.request2(endPoint: movieStruct.first(where: { $0.title == endpoint })?.endpoint ?? .popular , model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems = data.results ?? []
                self.completion?()
            }
        }
    }
////    
//    func getPopular(endpoint: String? = nil) {
//        network.request2(endPoint: .popular, model: Movie.self) { data, error in
//            if let error {
//                self.errorHandler?(error)
//            } else if let data {
//                self.movieItems.append(.init(title: "Popular", item: data.results ?? [] ))
//                self.completion?()
//            }
//        }
//    }
//    
//    func getUpcoming(endpoint: String? = nil) {
//        network.request2(endPoint: .upcoming, model: Movie.self) { data, error in
//            if let error {
//                self.errorHandler?(error)
//            } else if let data {
//                self.movieItems.append(.init(title: "Upcoming", item: data.results ?? [] ))
//                self.completion?()
//            }
//        }
//    }
//    
//    func getTopRated(endpoint: String? = nil) {
//        network.request2(endPoint: .topRated, model: Movie.self) { data, error in
//            if let error {
//                self.errorHandler?(error)
//            } else if let data {
//                self.movieItems.append(.init(title: "TopRated", item: data.results ?? [] ))
//                self.completion?()
//            }
//        }
//    }
//
//
    
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
                self.movieItems = data.results ?? []
                self.completion?()
            }
        }
    }
    
    func getPopular() {
        network.request2(endPoint: .popular, model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems = data.results ?? []
                self.completion?()
            }
        }
    }
    
    func getUpcoming() {
        network.request2(endPoint: .upcoming, model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems = data.results ?? []
                self.completion?()
            }
        }
    }
    
    func getTopRated() {
        network.request2(endPoint: .topRated, model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.movieItems = data.results ?? []
                self.completion?()
            }
        }
    }

}
