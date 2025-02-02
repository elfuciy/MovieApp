//
//  NetworkManager.swift
//  Url
//
//  Created by Elsever on 29.01.25.
//

import Foundation
import Alamofire

enum EndPoint: String {
    case nowPlaying = "now_playing"
    case popular = "popular"
    case topRated = "top_rated"
    case upcoming = "upcoming"
}

enum EncodingType {
    case url
    case json
}

class NetworkManager {
    let baseUrl = "https://api.themoviedb.org/3/movie/"
    let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YWVmNTVjZDBhM2UwZDgzODY1YjZiYTc0Mzk0YjNiZCIsIm5iZiI6MTczODQxMDQzNi43MjEsInN1YiI6IjY3OWUwOWM0N2I0MTUzYTNiOTk1NGE0ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PbjszFro48ez7a8qpn5N-yJnJY7KqXJ-Ce2Uy8WpkEE"]
    
    func request2<T: Codable>(endPoint: EndPoint,
                              model: T.Type,
                              method: HTTPMethod = .get,
                              params: Parameters? = nil,
                              encodingType: EncodingType = .url,
                              completion: @escaping((T?, String?) -> Void)) {
        AF.request("\(baseUrl)\(endPoint.rawValue)",
                   method: method,
                   parameters: params,
                   encoding: encodingType == .url ? URLEncoding.default : JSONEncoding.default,
                   headers: header).responseDecodable(of: model.self) { response in
            switch response.result {
                case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
