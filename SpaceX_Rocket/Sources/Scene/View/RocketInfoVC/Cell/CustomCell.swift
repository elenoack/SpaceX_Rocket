//
//  CustomTableViewCell.swift
//  SpaceX_Rocket
//
//  Created by mac on 16.06.22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let reuseID = "CustomTableViewCell"
    
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
        quantityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -56),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Сonfiguration
    override func prepareForReuse() {
        super.prepareForReuse()
        quantityLabel.text = nil
    }
}



    

    

