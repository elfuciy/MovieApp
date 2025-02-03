//
//  ExtendedListController.swift
//  MovieApp
//
//  Created by Elsever on 03.02.25.
//

import UIKit

class ExtendedListController: UIViewController {

    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayout.createExpandedMovie())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(ExtendedListCell.self, forCellWithReuseIdentifier: "ExtendedListCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchBar: UITextField  = {
        let field = UITextField()
        field.placeholder = "Search"
        field.textAlignment = .center
        field.addTarget(self, action: #selector(searchData), for: .editingChanged)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let modelView = ExtendedListViewModel()
    var sectionName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configurUI() {
        view.backgroundColor = .systemGray6
        view.addSubview(searchView)
        view.addSubview(collection)
        searchView.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 50),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12 ),
            searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collection.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            searchBar.topAnchor.constraint(equalTo: searchView.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: searchView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: searchView.trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: searchView.bottomAnchor)
            
           
        ])
    }
    
    func configure() {
        modelView.getData(endpoint: sectionName)
        modelView.errorHandler = { error in
            print(error)
        }
        
        modelView.completion = {
            self.collection.reloadData()
        }
        configurUI()
        title = sectionName
    }
    
    @objc func searchData() {
        modelView.searchBarFunc(searchBar: searchBar.text ?? "", collectionView: collection)
        print(searchBar.text ?? "")
    }
}

extension ExtendedListController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelView.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "ExtendedListCell", for: indexPath) as! ExtendedListCell
        if modelView.isSearched {
            cell.configure(data: modelView.fileteredData[indexPath.row])

        } else {
            cell.configure(data: modelView.movieItems[indexPath.row])
        }
        return cell
    }
    
    
}
