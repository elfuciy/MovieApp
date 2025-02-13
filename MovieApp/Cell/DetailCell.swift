//
//  ExtendedListCell.swift
//  MovieApp
//
//  Created by Elsever on 03.02.25.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
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
        
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "Info"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var selectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var detail: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "Info"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trailer: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "Info"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cast: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "Info"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shots: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "Info"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: modelView.createSection())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(DetailCellCollectionCell.self, forCellWithReuseIdentifier: "DetailCellCollectionCell")
        collection.register(InfoCell.self, forCellWithReuseIdentifier: "InfoCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let modelView = DetailCellViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        layer.cornerRadius = 16
//        backgroundColor = .white
        [image,
         nameLabel,
         ratingView,
         languageView,
         timeView,
         infoLabel,
//         collection,
         selectionView
         ].forEach({addSubview($0)})
        ratingView.addSubview(ratingLabel)
        ratingView.addSubview(ratingImage)
        languageView.addSubview(languageLabel)
        languageView.addSubview(languageImage)
        timeView.addSubview(timeLabel)
        timeView.addSubview(timeImage)
        selectionView.addSubview(detail)
        selectionView.addSubview(trailer)
        selectionView.addSubview(cast)
        selectionView.addSubview(shots)

        
        
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 350),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            languageView.heightAnchor.constraint(equalToConstant: 24),
            languageView.widthAnchor.constraint(equalToConstant: 88),
            languageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            languageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            languageLabel.topAnchor.constraint(equalTo: languageView.topAnchor, constant: 4),
            languageLabel.centerYAnchor.constraint(equalTo: languageView.centerYAnchor),
            
            languageImage.leadingAnchor.constraint(equalTo:  languageLabel.trailingAnchor, constant: 4),
            languageImage.heightAnchor.constraint(equalToConstant: 25),
            languageImage.widthAnchor.constraint(equalToConstant: 25),
            
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
            
            selectionView.heightAnchor.constraint(equalToConstant: 40),
            selectionView.widthAnchor.constraint(equalToConstant: 350),
            selectionView.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 24),
            selectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            collection.heightAnchor.constraint(equalToConstant: 205),
//            collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            collection.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 24),
//            collection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            
            infoLabel.topAnchor.constraint(equalTo: selectionView.bottomAnchor, constant: 24),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
            
        ])
    }
    
    func configure(data: DetailProtocol, isSeen: Bool) {
        image.loadImage(url: data.imageUrl)
        nameLabel.text = data.titleText
        languageLabel.text = data.languageText
        ratingLabel.text = "\(data.ratingText.rounded())/10"
        timeLabel.text = "1h 66min"
        infoLabel.text = data.infoText
        infoLabel.isHidden = isSeen
    }
}
    
extension DetailCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch modelView.detailSections[indexPath.section] {
        case .selection:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "DetailCellCollectionCell", for: indexPath) as! DetailCellCollectionCell
            cell.backgroundColor = .brown
            return cell
        case .info:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCell
            cell.backgroundColor = .brown
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
}

