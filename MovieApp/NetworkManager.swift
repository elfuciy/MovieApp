//
//  NetworkManager.swift
//  Url
//
//  Created by Elsever on 29.01.25.
//

import Foundation
import Alamofire

enum EndPoint: String {
    case postItems = "posts"
}

enum EncodingType {
    case url
    case json
}

class NetworkManager {
    let baseUrl = "https://jsonplaceholder.typicode.com/"
    
    func request(endPoint: EndPoint, completion: @escaping((Data?, String?) -> Void)) {
        AF.request("\(baseUrl)\(endPoint.rawValue)").responseData { response in
            switch response.result {
                case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func request2<T: Codable>(endPoint: EndPoint,
                              model: T.Type,
                              method: HTTPMethod = .get,
                              params: Parameters? = nil,
                              encodingType: EncodingType = .url,
                              header: HTTPHeaders? = nil,
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
