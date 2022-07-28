//
//  HorizontalCell.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 16.06.22.
//

import UIKit


class HorizontalCell: UICollectionViewCell {
    // MARK: - Constants
    
    enum Metric {
        static let indent: CGFloat = 11
        static let viewRadius: CGFloat = 28
    }
    
    // MARK: - Properties
    
    static let reuseID = "HorizontalCell"
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        view.layer.cornerRadius = Metric.viewRadius
        return view
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    lazy var parameterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
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
            parameterLabel,
        ])
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            countLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -Metric.indent),
            
            parameterLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            parameterLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: Metric.indent),
        ])
    }
}
