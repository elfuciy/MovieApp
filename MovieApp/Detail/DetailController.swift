//
//  DetailController.swift
//  MovieApp
//
//  Created by Elsever on 08.02.25.
//

import UIKit

class DetailController: UIViewController {
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayout.CreateEstimateInfo())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(DetailCell.self, forCellWithReuseIdentifier: "ExtendedListCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

        var movieDeatail: SearchResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurUI()
    }
    
    private func configurUI() {
        view.backgroundColor = .white
        view.addSubview(collection)
        title = movieDeatail?.title
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}

extension DetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "ExtendedListCell", for: indexPath) as! DetailCell
            cell.configure(data: movieDeatail!)
        return cell
    }
}

