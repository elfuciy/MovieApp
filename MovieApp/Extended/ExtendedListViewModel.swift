//
//  ListViewModel.swift
//  MovieApp
//
//  Created by Elsever on 03.02.25.
//

import Foundation
import UIKit

//struct MovieStruct {
//    let title: Sections
//    let endpoint: MovieEndPoint
//}
class ExtendedListViewModel {
    
    var movieItems: [MovieResult] = []
    var fileteredData: [MovieResult] = []
    
    let network = NetworkManager()
    
    var errorHandler: ((String) -> Void)?
    var completion: (() -> Void)?
    
    var isSearched: Bool = false
    
   
}
