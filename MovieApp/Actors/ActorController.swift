//
//  ActorController.swift
//  MovieApp
//
//  Created by Elsever on 07.02.25.
//

import UIKit

class ActorController: UIViewController {
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayout.createActor())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    let modelView = ActorViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configurUI()
    }
    
    private func configurUI() {
        view.addSubview(collection)
        
        NSLayoutConstraint.activate([

            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configure() {
        modelView.getData()

        modelView.errorHandler = { error in
            print(error)
        }
        
        modelView.completion = {
            self.collection.reloadData()
        }
    }
}

extension ActorController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelView.actorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.configure(data: modelView.actorArray[indexPath.row])
        return cell
    }
}
