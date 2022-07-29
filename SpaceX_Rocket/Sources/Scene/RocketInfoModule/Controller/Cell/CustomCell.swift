//
//  CustomTableViewCell.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 16.06.22.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    // MARK: - Constants
    
    enum Metric {
        static let labelIndent: CGFloat = 56
    }
    
    enum Strings {
        static let fatalError: String = "init(coder:) has not been implemented"
        static let reuseID: String = "CustomTableViewCell"
    }
    
    // MARK: - Properties
    
    static let reuseID = Strings.reuseID
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        addSubviewsForAutoLayout([
            quantityLabel,
        ])
        
        NSLayoutConstraint.activate([
            quantityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quantityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metric.labelIndent),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Strings.fatalError)
    }
    
    // MARK: - Сonfiguration
    
    override func prepareForReuse() {
        super.prepareForReuse()
        quantityLabel.text = nil
    }
}







