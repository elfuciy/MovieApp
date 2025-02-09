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
    var searchArray = [SearchResult]()
    
    func getData(queryString: String) {
        let path = SearchEndpoint.query(query: queryString).path
        print(path)
        network.request2(endPoint: path, model: SearchModel.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.searchArray = data.results ?? []
                self.completion?()
            }
        }
    }
}
