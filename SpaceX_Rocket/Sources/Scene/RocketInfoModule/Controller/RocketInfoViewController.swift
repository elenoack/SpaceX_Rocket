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
    
    var presenter: RocketInfoPresenterProtocol?
    let networkService = NetworkService()
    let defaults = UserDefaultsStorage()
    var serialNumber: Int 
  
    // MARK: - Initial
    
    init(serialNumber: Int) {
        self.serialNumber = serialNumber
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError(Strings.fatalError)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDisplay()
    }
}

// MARK: - Settings

extension RocketInfoViewController {
    
    func setupView() {
        view = RocketInfoView()
        view.backgroundColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        presenter?.fetchRocketsImage(with: serialNumber)
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

// MARK: - RocketViewProtocol

extension RocketInfoViewController: RocketViewProtocol {
    
    func success() {
            rocketInfoView?.tableView.reloadData()
    }
    
    func setupDisplay() {
        DispatchQueue.main.async {
            [self] in
            rocketInfoView?.rocketName.text = presenter?.rockets?[serialNumber].rocketName
            if serialNumber == 0 {
                rocketInfoView?.imageView.image = UIImage(named: Strings.rocketImage)
            } else {
                rocketInfoView?.imageView.image = self.presenter?.rocketsImage
            }
        }
    }
    
    func successSave() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
        rocketInfoView?.collectionView.reloadData()
        rocketInfoView?.activityIndicatorView.stopAnimating()
        rocketInfoView?.blurView.isHidden = true
        }
    }
    
    func failure(error: NetworkError) {
        self.showError(error)
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
        
        DispatchQueue.main.async {
            
            if let rocket = self.presenter?.rockets?[self.serialNumber]  {
                switch indexPath.row {
                case 0:
                    if self.defaults.unitsHeight < 1 {
                        cell.countLabel.text = "\(rocket.height.meters)"
                        cell.parameterLabel.text = Strings.heightParameterMeter
                    } else {
                        cell.countLabel.text = "\(rocket.height.feet)"
                        cell.parameterLabel.text = Strings.heightParameterFeet
                    }
                case 1:
                    if self.defaults.unitsDiameter < 1 {
                        cell.countLabel.text = "\(rocket.diameter.meters)"
                        cell.parameterLabel.text = Strings.diameterParameterMeter
                    } else {
                        cell.countLabel.text = "\(rocket.diameter.feet)"
                        cell.parameterLabel.text = Strings.diameterParameterFeet
                    }
                case 2:
                    if self.defaults.unitsMass < 1 {
                        cell.countLabel.text = "\(rocket.mass.kg)"
                        cell.parameterLabel.text = Strings.massParameterKg
                    } else {
                        cell.countLabel.text = "\(rocket.mass.lb)"
                        cell.parameterLabel.text = Strings.massParameterLb
                    }
                case 3:
                    if let rocketPayload = rocket.payload.first {
                        if self.defaults.unitsPayload < 1 {
                            cell.countLabel.text = "\(rocketPayload.kg)"
                            cell.parameterLabel.text = Strings.payloadParameterKg
                        } else {
                            cell.countLabel.text = "\(rocketPayload.lb)"
                            cell.parameterLabel.text = Strings.payloadParameterLb
                        }
                    }
                default:
                    cell.countLabel.text = nil
                    cell.parameterLabel.text = nil
                }
            }
        }
        presenter?.reload()
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
  
        if let rocket = self.presenter?.rockets?[serialNumber] {
            
            switch indexPath.section {
                
            case 0:
                switch indexPath.row {
                case 0:
                    configuration.text = Strings.firstLaunch
                    label.text = "\(rocket.firstFlightToPresent)"
                    label.minimumScaleFactor = 0.5
                    label.adjustsFontSizeToFitWidth = true
                case 1:
                    configuration.text = Strings.country
                    label.text = presenter?.localeСountryName()
                    label.adjustsFontSizeToFitWidth = true
                case 2:
                    configuration.text = Strings.coastLaunch
                    label.text = "\(rocket.coastLaunch)" + Strings.million
                default: configuration.image = nil
                }
                
            case 1:
                switch indexPath.row {
                case 0:
                    configuration.text = Strings.numberOfEngines
                    label.textColor = .systemGray
                    label.text = Strings.whitespace
                    cell.quantityLabel.text = "\(rocket.firstStage.engines)"
                case 1:
                    configuration.text = Strings.fuelAmount
                    label.textColor = .systemGray
                    label.font = UIFont.boldSystemFont(ofSize: 17)
                    label.text = Strings.tons
                    cell.quantityLabel.text = "\(rocket.firstStage.fuelAmount)"
                case 2:
                    configuration.text = Strings.burnTime
                    label.textColor = .systemGray
                    label.font = UIFont.boldSystemFont(ofSize: 17)
                    label.text = Strings.seconds
                    if  let burnTime = rocket.firstStage.burnTime {
                        cell.quantityLabel.text = "\(burnTime)"
                    } else {
                        cell.quantityLabel.text = "⏤"
                    }
                default: configuration.image = nil
                }
                
            case 2:
                switch indexPath.row {
                case 0:
                    configuration.text = Strings.numberOfEngines
                    label.textColor = .systemGray
                    label.text = Strings.whitespace
                    cell.quantityLabel.text = "\(rocket.secondStage.engines)"
                case 1:
                    configuration.text = Strings.fuelAmount
                    label.textColor = .systemGray
                    label.font = UIFont.boldSystemFont(ofSize: 17)
                    label.text = Strings.tons
                    cell.quantityLabel.text = "\(rocket.secondStage.fuelAmount)"
                case 2:
                    configuration.text = Strings.burnTime
                    label.textColor = .systemGray
                    label.font = UIFont.boldSystemFont(ofSize: 17)
                    label.text = Strings.seconds
                    if  let burnTime = rocket.secondStage.burnTime {
                        cell.quantityLabel.text = "\(burnTime)"
                    } else {
                        cell.quantityLabel.text = "⏤"
                    }
                default: configuration.image = nil
                }
            default: break
            }
        }
        cell.contentConfiguration = configuration
        return cell
    }
}

// MARK: - UITableViewDelegate

extension RocketInfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metric.tableViewHeight
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
            label.text = Strings.firstStage
        case 2:
            label.text = Strings.secondStage
        default:
            label.text = nil
        }
        headerView.addSubview(label)
        return headerView
    }
}

// MARK: - Actions

extension RocketInfoViewController {
    @objc
    func openLaunchVC()  {
        guard let rocketId = presenter?.rockets?[serialNumber].id else { return }
        guard let rocketName = presenter?.rockets?[serialNumber].rocketName else { return }
        self.presenter?.tapLaunchesButton(rocketId: rocketId, viewController: self, rocketName: rocketName)
    }
    
    @objc
    func openSettingsVC() {
        rocketInfoView?.blurView.isHidden = false
        presenter?.tapSettingButton(viewController: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            rocketInfoView?.activityIndicatorView.startAnimating()
        }
    }
}

// MARK: - Private

extension RocketInfoViewController {
    func showError(_ error: NetworkError) {
        rocketInfoView?.blurView.isHidden = false
        let action = UIAlertAction(title: Strings.alertActionTitle, style: .default, handler: (restart))
        showAlert(title: Strings.errorAlertTitle,
                  message: error.localizedDescription,
                  actions: [action])
    }
    
    func restart(action: UIAlertAction) {
        presenter?.fetchRocketsData()
    }
}
