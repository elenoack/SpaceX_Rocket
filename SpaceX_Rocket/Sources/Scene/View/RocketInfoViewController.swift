//
//  RocketInfoViewController.swift
//  SpaceX_Rocket
//
//  Created by mac on 15.06.22.
//

import UIKit

class RocketInfoViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rocket")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .brown
        return imageView
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var contentView: UIView = {
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
        label.text = "Название ракеты"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var settingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "gearshape"), for: UIControl.State.normal)
        button.tintColor = .white
//        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector()))
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseID)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .black
        tableView.sectionHeaderHeight = Metric.tableViewHeaderHeight
        return tableView
    }()
    
    private lazy var watchLaunchesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Посмотреть запуски", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.layer.cornerRadius = Metric.watchLaunchesButtonHeight/3
//        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector()))
        return button
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupContentView()
    }
}

// MARK: - Settings

extension RocketInfoViewController {
    
    func setupHierarchy() {
        view.addSubviewsForAutoLayout([scrollView])
        scrollView.addSubviewsForAutoLayout([contentView])
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor)
        ])
        
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 1140)
        contentViewHeight.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewHeight
        ])
    }
}

// MARK: - SettingsContentView

extension RocketInfoViewController {
    
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
            watchLaunchesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension RocketInfoViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCell.reuseID, for: indexPath) as? HorizontalCell else {
            return HorizontalCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.countLabel.text = "234"
            cell.parameterLabel.text = "Высота, ft"
        case 1:
            cell.countLabel.text = "234"
            cell.parameterLabel.text = "Диаметр, ft"
        case 2:
            cell.countLabel.text = "234"
            cell.parameterLabel.text = "Масса, lb"
        case 3:
            cell.countLabel.text = "234"
            cell.parameterLabel.text = "Нагрузка, lb"
        default:
            cell.countLabel.text = nil
            cell.parameterLabel.text = nil
        }
        return cell
    }
}

// MARK: - UITableViewDataSource

extension RocketInfoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 3
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseID, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        var configuration = cell.defaultContentConfiguration()
        cell.backgroundColor = .black
        let label = UILabel.init(frame: CGRect(x:0, y:0, width: 124, height: 20))
        label.textAlignment = .right
        cell.accessoryView = label
        
        switch indexPath.section {
            
        case 0:
            switch indexPath.row {
            case 0:
                configuration.text = "Первый запуск"
                label.text = "7 февраля 2015"
            case 1:
                configuration.text = "Страна"
                label.text = "США"
            case 2:
                configuration.text = "Cтоимость запуска"
                label.text = "90 млн"
            default: configuration.image = nil
            }
            
            case 1:
            switch indexPath.row {
        case 0:
            configuration.text = "Количество двигателей"
                label.textColor = .systemGray
                label.text = "   "
                cell.quantityLabel.text = "27"
        case 1:
                configuration.text = "Количество топлива"
                label.textColor = .systemGray
                label.font = UIFont.boldSystemFont(ofSize: 17)
                label.text = "ton"
                cell.quantityLabel.text = "306.6"
        case 2:
            configuration.text = "Первый запуск"
                label.textColor = .systemGray
                label.font = UIFont.boldSystemFont(ofSize: 17)
                label.text = "sec"
                cell.quantityLabel.text = "306.6"
        default: configuration.image = nil
    }
        
    case 2:
            switch indexPath.row {
            case 0:
                configuration.text = "Количество двигателей"
                    label.textColor = .systemGray
                    label.text = "   "
                    cell.quantityLabel.text = "27"
            case 1:
                configuration.text = "Количество топлива"
                label.textColor = .systemGray
                label.font = UIFont.boldSystemFont(ofSize: 17)
                label.text = "ton"
                cell.quantityLabel.text = "306.6"
            case 2:
                configuration.text = "Первый запуск"
                    label.textColor = .systemGray
                    label.font = UIFont.boldSystemFont(ofSize: 17)
                    label.text = "sec"
                    cell.quantityLabel.text = "306.6"
            default: configuration.image = nil
}
        default: break
        }
        
        cell.contentConfiguration = configuration
        return cell
        
    }
}
    
    // MARK: - UITableViewDelegate
    
extension RocketInfoViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 52
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: Metric.tableViewHeaderHeight))
            
            let label = UILabel()
            
            label.frame = CGRect.init(x: 19, y: 0, width: headerView.frame.width, height: headerView.frame.height)
            label.font = UIFont.boldSystemFont(ofSize: 20.0)
            label.textColor = .white
            
            switch section {
            case 0:
                label.text = nil
            case 1:
                label.text = "Первая ступень"
            case 2:
                label.text = "Вторая ступень"
            default:
                label.text = nil
            }
            
            headerView.addSubview(label)
            return headerView
        }
    }
    
// MARK: - Constants

extension RocketInfoViewController {
    
    enum Metric {
        static let imageViewSize: CGFloat = 281
        static let indentImageView: CGFloat = 38
        static let containerViewHeight: CGFloat = 100
        static let rocketNameIndentTop: CGFloat = 36
        static let rocketNameIndent: CGFloat = 24
        static let settingButtonSize: CGFloat = 32
        static let containerViewRadius: CGFloat = 28
        static let collectionViewHeight: CGFloat = 100
        static let collectionViewIndent: CGFloat = 32
        static let collectionViewCellSize: CGFloat = 96
        static let collectionViewCellSpacing: CGFloat = 12
        static let watchLaunchesButtonHeight: CGFloat = 60
        static let tableViewIndent: CGFloat = 8
        static let tableViewMinusIndent: CGFloat = 24
        static let tableViewHeaderHeight: CGFloat = 50
    }
}
