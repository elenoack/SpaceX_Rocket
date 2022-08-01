//
//  LaunchListViewController.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 16.06.2022.
//

import UIKit

class LaunchListViewController: UIViewController {
    // MARK: - Properties
    
    private var launchListView: LaunchListView? {
        guard isViewLoaded else { return nil }
        return view as? LaunchListView
    }
    
    var presenter: LaunchListPresenterProtocol?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupavigationController()
    }
    
    //MARK: - Settings
    
    private func setupView() {
        view = LaunchListView()
        launchListView?.tableView.dataSource = self
        launchListView?.tableView.delegate = self
    }
    
    private func setupavigationController() {
        navigationController?.isNavigationBarHidden = false
        title = presenter?.rocketName
    }
}

//MARK: - UITableViewDataSource

extension LaunchListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.launches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Metric.sectionTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchListCell.reuseId, for: indexPath) as? LaunchListCell else { return LaunchListCell()}
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        guard let rows = presenter?.launches else { return cell }
        let sortRows = rows.sorted(by: { $0.dateLocal > $1.dateLocal })
        let row = sortRows[indexPath.section]
        
        cell.dateLabel.text = row.firstLaunchData
        cell.nameLabel.text = row.name
        if row.success == true {
            cell.launchImage.image = UIImage(named: Strings.imageName)
        } else {
            cell.launchImage.image = UIImage(named: Strings.imageNameFail)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Metric.tableViewHeight
    }
}

//MARK: - UITableViewDelegate

extension LaunchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Metric.tableViewHeightHeader
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.black
        return headerView
    }
}

// MARK: - LaunchViewProtocol

extension LaunchListViewController: LaunchViewProtocol {
    
    func success() {
        launchListView?.activityIndicatorView.startAnimating()
        launchListView?.blackView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
            launchListView?.tableView.reloadData()
            launchListView?.activityIndicatorView.stopAnimating()
            launchListView?.blackView.isHidden = true
        }
    }
    
    func successNil() {
        showInfo()
    }
    
    func failure(error: NetworkError) {
        self.showError(error)
    }
}

// MARK: - Private

extension LaunchListViewController {
    
    func showError(_ error: NetworkError) {
        launchListView?.blackView.isHidden = true
        let action = UIAlertAction(title: Strings.alertActionTitle, style: .default, handler: (restart))
        showAlert(title: Strings.errorAlertTitle,
                  message: error.localizedDescription,
                  actions: [action])
    }
    
    func restart(action: UIAlertAction) {
        presenter?.fetchLaunchesData()
    }
    
    func showInfo() {
        launchListView?.blackView.isHidden = true
        let action = UIAlertAction(title: Strings.alertActionTitle, style: .default, handler: (stop))
        showImageAlert(title: Strings.alertTitle,
                       message: Strings.alertMessage,
                       actions: [action])
    }
    
    func stop(action: UIAlertAction) {
        presenter?.tapBackBarButton(viewController: self)
    }
}

// MARK: - Constants

extension LaunchListViewController {
    
    enum Metric {
        static let sectionTableView: Int = 1
        static let tableViewHeight: CGFloat = 100
        static let tableViewHeightHeader: CGFloat = 10
    }
    
    enum Strings {
        static let imageName: String = "ok"
        static let imageNameFail: String = "fail"
        static let errorAlertTitle: String = "Что-то пошло не так..."
        static let alertActionTitle: String = "OK"
        static let alertTitle: String = "Информация отсутствует"
        static let alertMessage: String = "\n\n"
    }
}


