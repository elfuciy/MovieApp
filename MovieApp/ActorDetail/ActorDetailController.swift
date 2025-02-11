//
//  ActorDetailController.swift
//  MovieApp
//
//  Created by Elsever on 11.02.25.
//

import UIKit

class ActorDetailController: UIViewController {

    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayout.doubleCreateImageLabel())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "ImageLabelCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let modelView = ActorDetailViewModel()
    
    var sentId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configurUI()
    }
    
    private func configurUI() {
        view.addSubview(collection)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([

            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configure() {
        modelView.getData(id: sentId ?? 0)

        modelView.errorHandler = { error in
            print(error)
        }
        
        modelView.completion = {
            self.collection.reloadData()
        }
    }
}

extension ActorDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelView.actorMoviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "ImageLabelCell", for: indexPath) as! ImageLabelCell
        cell.configure(data: modelView.actorMoviesArray[indexPath.row])
        return cell
    }
    
}
