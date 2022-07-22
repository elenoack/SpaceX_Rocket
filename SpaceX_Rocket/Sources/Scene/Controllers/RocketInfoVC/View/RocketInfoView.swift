//
//  RocketInfoView.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 22.07.22.
//

import UIKit

  class RocketInfoView: UIView {
    // MARK: - Properties
    
    weak var viewController: RocketInfoViewController?

    //MARK: - Views

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Strings.imageViewTitle)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .brown
        return imageView
    }()
    
      private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
      private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.layer.cornerRadius = Metric.containerViewRadius
        return view
    }()
    
    private lazy var rocketName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.text = Strings.rocketName
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var settingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: Strings.settingButtonSystemName), for: UIControl.State.normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HorizontalCell.self, forCellWithReuseIdentifier: HorizontalCell.reuseID)
        return collectionView
    }()
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Metric.collectionViewCellSize, height: Metric.collectionViewCellSize)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Metric.collectionViewCellSpacing
        return layout
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: . grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseID)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .black
        tableView.sectionHeaderHeight = Metric.tableViewHeaderHeight
        return tableView
    }()
    
    lazy var watchLaunchesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.watchLaunchesButtonTitle, for: .normal)
        button.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.layer.cornerRadius = Metric.watchLaunchesButtonHeight/3
        return button
    }()
    
      // MARK: - Initial
      init() {
          super.init(frame: .zero)
          commonInit()
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
          commonInit()
      }
      
      private func commonInit() {
          backgroundColor = .lightGray
          setupHierarchy()
          setupLayout()
          setupContentView()
      }

    // MARK: - Settings
    private func setupHierarchy() {
        addSubviewsForAutoLayout([scrollView])
        scrollView.addSubviewsForAutoLayout([contentView])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor)
        ])
        
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: Metric.contentViewHeight)
        contentViewHeight.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewHeight
        ])
    }
}

// MARK: - SettingsContentView
extension RocketInfoView {
    
    func setupContentView() {
        setupHierarchyContentView()
        setupLayoutContentView()
    }
    
    func setupHierarchyContentView() {
        contentView.addSubviewsForAutoLayout([
            imageView,
            containerView,
            tableView,
            collectionView,
            watchLaunchesButton,
        ])
        
        containerView.addSubviewsForAutoLayout([
            rocketName,
            settingButton,
        ])
    }
    
    func setupLayoutContentView() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: Metric.imageViewSize),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            containerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -Metric.indentImageView),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.heightAnchor.constraint(equalToConstant: Metric.containerViewHeight),
            
            rocketName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Metric.rocketNameIndentTop),
            rocketName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Metric.rocketNameIndent),
            
            settingButton.centerYAnchor.constraint(equalTo: rocketName.centerYAnchor),
            settingButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Metric.rocketNameIndent),
            settingButton.heightAnchor.constraint(equalToConstant: Metric.settingButtonSize),
            settingButton.widthAnchor.constraint(equalToConstant: Metric.settingButtonSize),
            
            collectionView.topAnchor.constraint(equalTo: rocketName.bottomAnchor, constant: Metric.collectionViewIndent),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.rocketNameIndent),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.rocketNameIndent),
            collectionView.heightAnchor.constraint(equalToConstant: Metric.collectionViewHeight),
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -Metric.tableViewMinusIndent),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.tableViewIndent),
            tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Metric.tableViewIndent),
            
            watchLaunchesButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: Metric.collectionViewIndent),
            watchLaunchesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.rocketNameIndent),
            watchLaunchesButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Metric.rocketNameIndent),
            watchLaunchesButton.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            watchLaunchesButton.heightAnchor.constraint(equalToConstant: Metric.watchLaunchesButtonHeight),
            watchLaunchesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
    }
}

// MARK: - Constants
extension RocketInfoView {
    
    enum Metric {
        static let imageViewSize: CGFloat = 348
        static let indentImageView: CGFloat = 38
        static let containerViewHeight: CGFloat = 100
        static let rocketNameIndentTop: CGFloat = 36
        static let rocketNameIndent: CGFloat = 24
        static let settingButtonSize: CGFloat = 32
        static let containerViewRadius: CGFloat = 28
        static let collectionViewHeight: CGFloat = 100
        static let collectionViewIndent: CGFloat = 32
        static let collectionViewCellSize: CGFloat = 100
        static let collectionViewCellSpacing: CGFloat = 12
        static let watchLaunchesButtonHeight: CGFloat = 60
        static let tableViewIndent: CGFloat = 8
        static let tableViewMinusIndent: CGFloat = 28
        static let tableViewHeaderHeight: CGFloat = 50
        static let contentViewHeight: CGFloat = 1280
    }
    
    enum Strings {
        static let imageViewTitle: String = "rocket"
        static let rocketName: String = "Название ракеты"
        static let settingButtonSystemName: String = "gearshape"
        static let watchLaunchesButtonTitle: String = "Посмотреть запуски"
    }
}
