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
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchListCell.reuseId, for: indexPath) as? LaunchListCell else { return LaunchListCell()}
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
            guard let rows = presenter?.launches else { return cell }
            
            let row = rows[indexPath.section]
            
            cell.dateLabel.text = row.firstLaunchData
            cell.nameLabel.text = row.name
            if row.success == true {
                cell.launchImage.image = UIImage(named: "ok")
            } else {
                cell.launchImage.image = UIImage(named: "fail")
            }
        return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

//MARK: - UITableViewDelegate

extension LaunchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
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
        let alert = UIAlertController(title: "Что-то пошло не так...", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: (restart))
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func restart(action: UIAlertAction) {
        presenter?.fetchLaunchesData()
    }
    
    func showInfo() {
        launchListView?.blackView.isHidden = true
        guard let alert = launchListView?.alert else { return }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: (stop)))
        self.present(alert, animated: true, completion: nil)
    }
    
    func stop(action: UIAlertAction) {
        presenter?.tapBackButton(viewController: self)
    }
}


