//
//  ViewController.swift
//  MovieApp
//
//  Created by Elsever on 31.01.25.
//

import UIKit

class HomeController: UIViewController {

    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: modelView.createSecton())
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        collection.register(HeaderCell.self, forCellWithReuseIdentifier: "HeaderCell")
        return collection
    }()
    
    let modelView = HomeModelView()
    var sectionTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configure()
        
    }
    
    private func configureUI() {
        view.addSubview(collection)
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])}
    
    private func configure() {
        modelView.getAllData()
      
        modelView.errorHandler = { error in
            print(error)
        }
        
        modelView.completion = {
            self.collection.reloadData()
        }
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelView.itemNumber(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch modelView.sections[indexPath.section] {
        case .heading:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            if modelView.sections[indexPath.section] == .heading {
                cell.configure(title:modelView.sections[indexPath.section + 1].rawValue, index: indexPath.section + 1)
            }
            cell.callBack = { index in
                let controller = ExtendedListController()
                controller.sectionName = self.modelView.movieItems.filter({$0.title == self.modelView.sections[index].rawValue}).first!.title
                self.navigationController?.show(controller, sender: nil)
            }
            return cell
        case .popular, .trending, .upcoming, .nowPlaying:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
            if modelView.sections[indexPath.section] == .nowPlaying || modelView.sections[indexPath.section] == .popular || modelView.sections[indexPath.section] == .trending || modelView.sections[indexPath.section] == .upcoming {
                cell.configure(data: modelView.movieItems.filter({$0.title == modelView.sections[indexPath.section].rawValue}).first!.item[indexPath.row])
            }
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        8
    }
    
}

