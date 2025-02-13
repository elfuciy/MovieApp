//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Elsever on 08.02.25.
//

import Foundation
import Alamofire
class SearchViewModel {
    
    let network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    var searchMovie: Movie?
    var searchMovieResult = [MovieResult]()
    
    func getData(queryString: String, page: Int) {
        let path = SearchEndpoint.query(query: queryString, page: page).path
        print(path)
        network.request2(endPoint: path, model: Movie.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.searchMovie = data
                self.searchMovieResult.append(contentsOf: data.results ?? []) 
                self.completion?()
            }
        }
    }
}
