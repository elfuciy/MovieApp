//
//  ActorDetailVoewModel.swift
//  MovieApp
//
//  Created by Elsever on 11.02.25.
//

import Foundation

class ActorDetailViewModel {
    
    var actorMoviesArray = [Cast]()
    
    var network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    
    func getData(id: Int) {
        let path = ActorEndpoint.actorMovieCredits(id: id).path
        network.request2(endPoint: path, model: ActorMovieDetailModel.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.actorMoviesArray = data.crew ?? []
                self.completion?()
            }
        }
    }
}
