//
//  HorizontalCell.swift
//  SpaceX_Rocket
//
//  Created by mac on 15.06.22.
//

import UIKit

class HorizontalCell: UICollectionViewCell {
    // MARK: - Constants
    
    enum Metric {
        static let cellRadius: CGFloat = 32
        static let indent: CGFloat = 11
    }
    
    // MARK: - Properties
    
    static let reuseID = "HorizontalCell"
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = Metric.cellRadius
        return view
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension HorizontalCell {
    
    func configure() {
        contentView.addSubviewsForAutoLayout([
            cellView,
            countLabel,
            nameLabel,
        ])
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            countLabel.centerYAnchor.constraint(equalTo:  cellView.centerYAnchor, constant: -Metric.indent),
            countLabel.centerXAnchor.constraint(equalTo:  cellView.centerXAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo:  cellView.centerYAnchor, constant: Metric.indent),
            nameLabel.centerXAnchor.constraint(equalTo:  cellView.centerXAnchor),
        ])
    }
}
