//
//  TrailerCell.swift
//  MovieApp
//
//  Created by Elsever on 15.02.25.
//

import UIKit

class TrailerCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "star")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(image)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200),
//            image.topAnchor.constraint(equalTo: topAnchor)
            image.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
    }
}
