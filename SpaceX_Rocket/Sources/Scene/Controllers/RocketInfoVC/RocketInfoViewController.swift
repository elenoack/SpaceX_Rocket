//
//  RocketInfoViewController.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 15.06.22.
//

import UIKit

class RocketInfoViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties
    
    private var rocketInfoView: RocketInfoView? {
        guard isViewLoaded else { return nil }
        return view as? RocketInfoView
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
}

// MARK: - Settings
extension RocketInfoViewController {
    
    func setupView() {
        view = RocketInfoView()
        rocketInfoView?.collectionView.dataSource = self
        rocketInfoView?.collectionView.delegate = self
        rocketInfoView?.tableView.dataSource = self
        rocketInfoView?.tableView.delegate = self
    }
    
    func setupActions() {
        rocketInfoView?.watchLaunchesButton.addTarget(self, action: #selector(openLaunchVC), for: .touchUpInside)
        rocketInfoView?.settingButton.addTarget(self, action: #selector(openSettingsVC), for: .touchUpInside)
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
            cell.countLabel.text = Strings.heightСountLabelText
            cell.parameterLabel.text = Strings.heightParameterLabelText
        case 1:
            cell.countLabel.text = Strings.diameterСountLabelText
            cell.parameterLabel.text = Strings.diameterParameterLabelText
        case 2:
            cell.countLabel.text = Strings.massСountLabelText
            cell.parameterLabel.text = Strings.massParameterLabelText
        case 3:
            cell.countLabel.text = Strings.loadСountLabelText
            cell.parameterLabel.text = Strings.loadParameterLabelText
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
        cell.selectionStyle = .none
        configuration.textProperties.adjustsFontSizeToFitWidth = true

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
                configuration.text = "Время сгорания"
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
                configuration.text = "Время сгорания"
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

// MARK: - Actions
extension RocketInfoViewController{
    
    @objc
    func openLaunchVC()  {
        let viewController = LaunchListViewController()
        self.navigationItem.backButtonTitle = "Назад"
        viewController.title = "Имя"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    func openSettingsVC() {
        let viewController = SettingsViewController()
        viewController.title = "Настройки"
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true)
    }
}

// MARK: - Constants
extension RocketInfoViewController {
    
    enum Metric {
        static let tableViewHeaderHeight: CGFloat = 50
    }
    
    enum Strings {
        static let heightСountLabelText: String = "234"
        static let heightParameterLabelText: String = "Высота, ft"
        static let diameterСountLabelText: String = "234"
        static let diameterParameterLabelText: String = "Диаметр, ft"
        static let massСountLabelText: String = "234"
        static let massParameterLabelText: String = "Масса, lb"
        static let loadСountLabelText: String = "234"
        static let loadParameterLabelText: String = "Нагрузка, lb"
    }
}

