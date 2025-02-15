//
//  ActorController.swift
//  MovieApp
//
//  Created by Elsever on 07.02.25.
//

import UIKit

class ActorController: UIViewController {
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayout.doubleCreateImageLabel())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "ImageLabelCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    let modelView = ActorViewModel()
    
    var pageNumber = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
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
    
    private func getData() {
        modelView.getData(page: pageNumber)

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
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "ImageLabelCell", for: indexPath) as! ImageLabelCell
        cell.configure(data: modelView.actorArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ActorDetailController()
        controller.sentId = modelView.actorArray[indexPath.row].id
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if modelView.actorArrayData?.page ?? 0 < modelView.actorArrayData?.totalPages ?? 0 && indexPath.row == modelView.actorArray.count - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.getData()
            }
        }
    }
}
