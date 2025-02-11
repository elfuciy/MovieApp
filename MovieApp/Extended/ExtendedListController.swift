//
//  ExtendedListController.swift
//  MovieApp
//
//  Created by Elsever on 03.02.25.
//

import UIKit

class ExtendedListController: UIViewController {

    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayout.doubleCreateImageLabel())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "ImageLabelCell")
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
    
    var items = [MovieResult]()
    var fileteredData = [MovieResult]()
    var isSearched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurUI()
    }
    
    private func configurUI() {
        view.backgroundColor = .systemGray6
        title = sectionName
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
    
    @objc func searchData() {
        if searchBar.text != "" {
            fileteredData = items.filter{ $0.originalTitle!.lowercased().contains(searchBar.text?.lowercased() ?? "")}
            isSearched = true
            collection.reloadData()
        } else {
            isSearched = false
            collection.reloadData()
        }
    }
    
    func numberOfItems() -> Int {
            if isSearched {
                return fileteredData.count
            } else {
                return items.count
            }
    }
}

extension ExtendedListController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "ImageLabelCell", for: indexPath) as! ImageLabelCell
        if isSearched {
            cell.configure(data: fileteredData[indexPath.row])
        } else {
            cell.configure(data: items[indexPath.row])
        }
        return cell
    }
    
    
}
