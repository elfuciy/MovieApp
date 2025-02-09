//
//  ExtendedListCell.swift
//  MovieApp
//
//  Created by Elsever on 03.02.25.
//

import UIKit

class ExtendedListCell: UICollectionViewCell {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .systemGray
        label.text = "rating"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "genre"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var directorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "director"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var languageView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ratingView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lengthView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        layer.cornerRadius = 16
        backgroundColor = .white
        [image,
         nameLabel,
         genreLabel,
         directorLabel,
         languageView,
         ratingView,
         lengthView].forEach({addSubview($0)})
        ratingView.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 350),
            image.widthAnchor.constraint(equalToConstant: 325),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            languageView.heightAnchor.constraint(equalToConstant: 24),
            languageView.widthAnchor.constraint(equalToConstant: 88),
            languageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            languageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            lengthView.heightAnchor.constraint(equalToConstant: 24),
            lengthView.widthAnchor.constraint(equalToConstant: 103),
            lengthView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            lengthView.leadingAnchor.constraint(equalTo: languageView.trailingAnchor, constant: 44),
            
            ratingView.heightAnchor.constraint(equalToConstant: 24),
            ratingView.widthAnchor.constraint(equalToConstant: 71),
            ratingView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(equalTo: lengthView.trailingAnchor, constant: 44),
            
            ratingLabel.topAnchor.constraint(equalTo: ratingView.topAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor),
            ratingLabel.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor),
            
            genreLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 8),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            directorLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 8),
            directorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            
        ])
    }
    
    func configure(data: MovieCellProtocol) {
        image.loadImage(url: data.imageUrl)
        nameLabel.text = data.titleText
    }
}
    

