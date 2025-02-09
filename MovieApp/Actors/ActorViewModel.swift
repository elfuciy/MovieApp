//
//  ActorViewModel.swift
//  MovieApp
//
//  Created by Elsever on 07.02.25.
//

import Foundation

class ActorViewModel {
    
    var actorArray = [ActorResult]()
    
    var network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    
    func getData() {
        let path = ActorEndpoint.actor.path
        network.request2(endPoint: path, model: ActorModel.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.actorArray = data.results ?? []
                self.completion?()
            }
        }
    }
}
