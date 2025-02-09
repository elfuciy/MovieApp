//
//  File.swift
//  MovieApp
//
//  Created by Elsever on 05.02.25.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func loadImage(url: String) {
        let urlPrefix = "\(NetworkManager().imageUrl)\(url)"
        let url = URL(string: "\(urlPrefix)")
        self.kf.setImage(with: url)
    }
}

