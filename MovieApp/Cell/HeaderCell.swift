//
//  HeadingCell.swift
//  MovieApp
//
//  Created by Elsever on 01.02.25.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("see all", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(nameLabel)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    func configure(title: String, data: [MovieResult]) {
        configureUI()
        nameLabel.text = title
    }
}
