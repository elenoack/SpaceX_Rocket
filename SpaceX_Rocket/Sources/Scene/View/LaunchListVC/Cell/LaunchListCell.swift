//
//  LaunchListCell.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 16.06.2022.
//

import UIKit

class LaunchListCell: UITableViewCell {
    
    static let reuseId = "LaunchListCell"
    
    //MARK: - Views
    private lazy var verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "testData"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "testData"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    private lazy var launchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ok")
        return imageView
    }()
    
    //MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 12/255, green: 11/255, blue: 13/255, alpha: 1)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings
    private func setupHierarchy() {
        contentView.addSubviewsForAutoLayout([
            launchImage,
            verticalStack,
        ])
        
        verticalStack.addArrangedSubviewsForAutoLayout([
            nameLabel,
            dateLabel
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.leadingSpacing),
            verticalStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            launchImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metric.trailingSpacing),
            launchImage.widthAnchor.constraint(equalToConstant: Metric.imageWidth),
            launchImage.heightAnchor.constraint(equalToConstant: Metric.imageHeight),
            launchImage.centerYAnchor.constraint(equalTo: verticalStack.centerYAnchor)
        ])
    }
}

//MARK: - Metrics
extension LaunchListCell {
    enum Metric {
        static let imageWidth: CGFloat = 40
        static let imageHeight: CGFloat = 40
        static let leadingSpacing: CGFloat = 50
        static let trailingSpacing: CGFloat = -50
    }
}
