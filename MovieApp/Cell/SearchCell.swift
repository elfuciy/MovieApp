//
//  CollectionViewCell.swift
//  MovieApp
//
//  Created by Elsever on 09.02.25.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
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
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .systemGray
        label.text = "rating"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(systemName: "star.fill")
        image.layer.cornerRadius = 16
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var languageView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.text = "director"
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var languageImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        image.image = UIImage(systemName: "globe")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var timeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.text = "director"
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        image.image = UIImage(systemName: "clock")
        image.translatesAutoresizingMaskIntoConstraints = false
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
        layer.cornerRadius = 16
        backgroundColor = .white
        [image,
         nameLabel,
         ratingView,
         languageView,
         timeView
//         genreLabel,
//         directorLabel,
//         languageView,
//         ratingView,
         /*lengthView*/].forEach({addSubview($0)})
        ratingView.addSubview(ratingLabel)
        ratingView.addSubview(ratingImage)
        languageView.addSubview(languageLabel)
        languageView.addSubview(languageImage)
        timeView.addSubview(timeLabel)
        timeView.addSubview(timeImage)
        
        
        
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
            languageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            languageLabel.topAnchor.constraint(equalTo: languageView.topAnchor, constant: 4),
            languageLabel.centerYAnchor.constraint(equalTo: languageView.centerYAnchor),
            
            languageImage.leadingAnchor.constraint(equalTo:  languageLabel.trailingAnchor, constant: 4),
            languageImage.heightAnchor.constraint(equalToConstant: 25),
            languageImage.widthAnchor.constraint(equalToConstant: 25),
//            languageImage.centerYAnchor.constraint(equalTo: languageView.centerYAnchor),
            
            timeView.heightAnchor.constraint(equalToConstant: 24),
            timeView.widthAnchor.constraint(equalToConstant: 103),
            timeView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            timeView.leadingAnchor.constraint(equalTo: languageView.trailingAnchor, constant: 44),
            
            timeLabel.topAnchor.constraint(equalTo: timeView.topAnchor, constant: 4),
            timeLabel.centerYAnchor.constraint(equalTo: timeView.centerYAnchor),

            timeImage.leadingAnchor.constraint(equalTo:  timeLabel.trailingAnchor, constant: 4),
            timeImage.heightAnchor.constraint(equalToConstant: 25),
            timeImage.widthAnchor.constraint(equalToConstant: 25),
            
            ratingView.heightAnchor.constraint(equalToConstant: 24),
            ratingView.widthAnchor.constraint(equalToConstant: 71),
            ratingView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: 44),
            
            ratingLabel.topAnchor.constraint(equalTo: ratingView.topAnchor, constant: 4),
            ratingLabel.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
            
            ratingImage.leadingAnchor.constraint(equalTo:  ratingLabel.trailingAnchor, constant: 4),
            ratingImage.heightAnchor.constraint(equalToConstant: 25),
            ratingImage.widthAnchor.constraint(equalToConstant: 25),
            
        ])
    }
    
    func configure(data: SearchProtocol) {
        image.loadImage(url: data.imageUrl)
        nameLabel.text = data.titleText
        languageLabel.text = data.languageText
        ratingLabel.text = "\(data.ratingText.rounded())/10"
        timeLabel.text = "1h 66min"
    }
}
