//
//  ActorViewModel.swift
//  MovieApp
//
//  Created by Elsever on 07.02.25.
//

import Foundation

class ActorViewModel {
    
    var actorArray = [ActorResult]()
    var actorArrayData: ActorModel?
    var network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    
    func getData(page: Int) {
        let path = ActorEndpoint.actor(page: (actorArrayData?.page ?? 0) + 1).path
        print(path)
        network.request2(endPoint: path, model: ActorModel.self) { data, error in
            if let error {
                self.errorHandler?(error)
            } else if let data {
                self.actorArrayData = data
                self.actorArray.append(contentsOf: data.results ?? [])
                self.completion?()
            }
        }
    }
}
