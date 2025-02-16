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
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
//        view.isUserInteractionEnabled = false
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
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Detail"
        label.textColor = .white
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.tag = 0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeSelection))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var trailer: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Trailer"
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tag = 1
        label.textAlignment = .center
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeSelection))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var cast: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Cast"
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tag = 2
        label.textAlignment = .center
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeSelection))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var shots: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Shots"
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tag = 3
        label.textAlignment = .center
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeSelection))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var genre: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Genre:"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mpaRating: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "MPAA Rating:"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var director: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Director:"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: modelView.createSection(tag: tagNumber))
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(DetailCellCollectionCell.self, forCellWithReuseIdentifier: "DetailCellCollectionCell")
        collection.register(TrailerCell.self, forCellWithReuseIdentifier: "TrailerCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = false
        return collection
    }()
    
    private var leftConstraint = NSLayoutConstraint()
    private var leftCollectionConstraint = NSLayoutConstraint()
    
    let modelView = DetailCellViewModel()
    
    var array = [DetailProtocol]()
    var tagNumber = 0
//    let array = [detail.tag.description, trailer.tag, cast.tag, shots.tag]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        layer.cornerRadius = 16
        [image,
         nameLabel,
         ratingView,
         languageView,
         timeView,
         infoLabel,
         collection,
         selectionView,
         genre,
         mpaRating,
         director
         ].forEach({addSubview($0)})
        ratingView.addSubview(ratingLabel)
        ratingView.addSubview(ratingImage)
        languageView.addSubview(languageLabel)
        languageView.addSubview(languageImage)
        timeView.addSubview(timeLabel)
        timeView.addSubview(timeImage)
        selectionView.addSubview(selectedView)
        selectionView.addSubview(detail)
        selectionView.addSubview(trailer)
        selectionView.addSubview(cast)
        selectionView.addSubview(shots)
       
        leftConstraint = selectedView.leadingAnchor.constraint(equalTo: selectionView.leadingAnchor)
        leftCollectionConstraint = collection.leadingAnchor.constraint(equalTo: genre.trailingAnchor, constant: 16)


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
            
            selectedView.heightAnchor.constraint(equalToConstant: 42),
            selectedView.widthAnchor.constraint(equalToConstant: 87),
            leftConstraint,
            selectedView.centerYAnchor.constraint(equalTo: selectionView.centerYAnchor),
            
            detail.leadingAnchor.constraint(equalTo: selectionView.leadingAnchor, constant: 0),
            detail.widthAnchor.constraint(equalToConstant: 87),
            detail.centerYAnchor.constraint(equalTo: selectionView.centerYAnchor),
            
            trailer.leadingAnchor.constraint(equalTo: detail.trailingAnchor),
            trailer.widthAnchor.constraint(equalToConstant: 87),

            trailer.centerYAnchor.constraint(equalTo: selectionView.centerYAnchor),

            cast.leadingAnchor.constraint(equalTo: trailer.trailingAnchor),
            cast.widthAnchor.constraint(equalToConstant: 87),
            cast.centerYAnchor.constraint(equalTo: selectionView.centerYAnchor),

            shots.leadingAnchor.constraint(equalTo: cast.trailingAnchor),
            shots.widthAnchor.constraint(equalToConstant: 87),

            shots.centerYAnchor.constraint(equalTo: selectionView.centerYAnchor),

            genre.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            genre.topAnchor.constraint(equalTo: selectionView.bottomAnchor, constant: 30),
            
            mpaRating.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            mpaRating.topAnchor.constraint(equalTo: genre.bottomAnchor, constant: 48),
            
            director.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            director.topAnchor.constraint(equalTo: mpaRating.bottomAnchor, constant: 48),
            
            collection.heightAnchor.constraint(equalToConstant: 200),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collection.topAnchor.constraint(equalTo: selectionView.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: genre.trailingAnchor, constant: 16),
            
            infoLabel.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 24),
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
        
        modelView.getData(id: data.movieid)
        
        modelView.errorHandler = { error in
            print(error)
        }
        
        modelView.completion = {
            self.collection.reloadData()
        }
    }
    
    @objc func changeSelection(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            self.animationChange()
        }
        
        if let label = sender.view as? UILabel {
            tagNumber = label.tag
        }
        hideLabel()
        collection.reloadData()
    }
    
    func reset() {
        self.detail.textColor = .black
        self.cast.textColor = .black
        self.shots.textColor = .black
        self.trailer.textColor = .black
    }
    
    func hideLabel() {
        switch modelView.selections[tagNumber] {
        case .detail:
            genre.isHidden = false
            mpaRating.isHidden = false
            director.isHidden = false
        case .trailer, .cast, .shots:
            genre.isHidden = true
            mpaRating.isHidden = true
            director.isHidden = true
        }
    }
    
    func animationChange() {
        switch modelView.selections[tagNumber] {
        case .detail:
            UILabel.animate(withDuration: 1) {
                self.reset()
            } completion: { _ in
                UIView.animate(withDuration: 0.5) {
                self.leftConstraint.constant = 0
                self.layoutIfNeeded()
                    self.detail.textColor = .white
                }
            }
        case .trailer:
            UILabel.animate(withDuration: 1) {
                self.reset()
            } completion: { _ in
                UIView.animate(withDuration: 1) {
                    self.leftConstraint.constant = 87
                    self.layoutIfNeeded()
                    self.trailer.textColor = .white
                }
            }
        case .cast:
            UILabel.animate(withDuration: 1) {
                self.reset()
            } completion: { _ in
                UIView.animate(withDuration: 1) {
                    self.leftConstraint.constant = 87 * 2
                    self.layoutIfNeeded()
                } completion: { _ in
                    UILabel.animate(withDuration: 10) {
                        self.cast.textColor = .white
                    }
                }
            }
        case .shots:
            UILabel.animate(withDuration: 1) {
                self.reset()
            } completion: { _ in
                UIView.animate(withDuration: 1) {
                    self.leftConstraint.constant = 87 * 3
                    self.layoutIfNeeded()
                    self.shots.textColor = .white
                }
            }
        }
    }
    
}
    
extension DetailCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelView.numberOfCells(section: section, tag: tagNumber)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch modelView.selections[tagNumber] {
        case .detail:
            switch modelView.detailSections[indexPath.section] {
            case .genre:
                let cell = collection.dequeueReusableCell(withReuseIdentifier: "DetailCellCollectionCell", for: indexPath) as! DetailCellCollectionCell
                cell.configure(data: modelView.detailArrayData?.genres?[indexPath.row].name ?? "")
                return cell
            case .rating:
                let cell = collection.dequeueReusableCell(withReuseIdentifier: "DetailCellCollectionCell", for: indexPath) as! DetailCellCollectionCell
                cell.configure(data: "rating")
                return cell
            case .director:
                let cell = collection.dequeueReusableCell(withReuseIdentifier: "DetailCellCollectionCell", for: indexPath) as! DetailCellCollectionCell
                cell.configure(data: "director")
                return cell
            }
        case .trailer:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "TrailerCell", for: indexPath) as! TrailerCell
            cell.image.backgroundColor = .red
            return cell
        case .cast:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "TrailerCell", for: indexPath) as! TrailerCell
            cell.image.backgroundColor = .blue
            return cell
        case .shots:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "TrailerCell", for: indexPath) as! TrailerCell
            cell.image.backgroundColor = .yellow
            return cell
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        modelView.numberOfSections(tag: tagNumber)
    }
}

