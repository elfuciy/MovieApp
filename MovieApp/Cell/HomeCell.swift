//
//  HomeCell.swift
//  MovieApp
//
//  Created by Elsever on 01.02.25.
//

import UIKit
import Kingfisher

class HomeCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .brown
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureUI() {
        addSubview(imageView)
        configure()
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure() {
        let urlPrefix = "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher"
        let url = URL(string: "\(urlPrefix)-1.jpg")
        imageView.kf.setImage(with: url)    }
}
