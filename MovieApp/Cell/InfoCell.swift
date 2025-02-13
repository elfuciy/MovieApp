//
//  InfoCell.swift
//  MovieApp
//
//  Created by Elsever on 13.02.25.
//

import UIKit

class InfoCell: UICollectionViewCell {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "Info"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var Infolabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "Info"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(Infolabel)
        
        NSLayoutConstraint.activate([
            Infolabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            Infolabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            Infolabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            Infolabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
