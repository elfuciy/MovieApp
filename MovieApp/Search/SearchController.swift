//
//  UnknownController.swift
//  MovieApp
//
//  Created by Elsever on 01.02.25.
//

import UIKit

class SearchController: UIViewController {

    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayout.createInfo())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(DetailCell.self, forCellWithReuseIdentifier: "DetailCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchBar: UITextField  = {
        let field = UITextField()
        field.placeholder = "Search"
        field.textAlignment = .left
        field.addTarget(self, action: #selector(searchData), for: .editingChanged)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var imageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let modelView = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(collection)
        view.addSubview(searchView)
        searchView.addSubview(searchBar)
        searchView.addSubview(imageView)
        title = "Search"
        view.backgroundColor = .systemGray6
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 50),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8 ),
            searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collection.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            searchBar.topAnchor.constraint(equalTo: searchView.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 4),
            searchBar.trailingAnchor.constraint(equalTo: searchView.trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: searchView.bottomAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 25),
            imageView.centerYAnchor.constraint(equalTo: searchView.centerYAnchor)
        ])
    }
    
    @objc func searchData() {
        modelView.getData(queryString: searchBar.text ?? "")
        
        modelView.errorHandler = { error in
            print(error)
        }
        
        modelView.completion = {
            self.collection.reloadData()
        }
    }
}

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelView.searchArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailCell
        cell.configure(data: modelView.searchArray[indexPath.row], isSeen: true)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailController()
//        controller.movieDeatail = modelView.searchArray[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
}
