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
//        navigationController.title = presenter.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: #selector (back))
    }
}

//MARK: - UITableViewDataSource

extension LaunchListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.launches?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchListCell.reuseId, for: indexPath) as? LaunchListCell else { return LaunchListCell()}
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        guard let rows = presenter?.launches else {
            
            cell.dateLabel.text = "Информация отсутствует"
            cell.launchImage.image = UIImage(systemName: "xmark.circle.fill")
            cell.launchImage.tintColor = .red
            
            
//            showInfo()
            return cell }
        
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

// MARK: - Actions

extension LaunchListViewController {
    
    @objc
    func back() {
        presenter?.tapBackBarButton()
    }
}

// MARK: - LaunchViewProtocol

extension LaunchListViewController: LaunchViewProtocol {
    
    func success() {
        launchListView?.tableView.reloadData()
    }
    
    func failure(error: NetworkError) {
        self.showError(error)
    }
}

// MARK: - Private

extension LaunchListViewController {
    
    func showError(_ error: NetworkError) {
        launchListView?.isHidden = true
        let alert = UIAlertController(title: "Что-то пошло не так...", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: (restart))
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func restart(action: UIAlertAction) {
        presenter?.fetchLaunchesData()
    }
    
//    func showInfo() {
//        launchListView?.isHidden = true
//
//        let alert = UIAlertController(title: "Информация отсутствует", message: "\n\n", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:(restart)))
//        let image = UIImageView(image: UIImage(named: "notInfo"))
//        alert.view.addSubview(image)
//        image.translatesAutoresizingMaskIntoConstraints = false
//        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0))
//        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: alert.view, attribute: .centerY, multiplier: 1, constant: 0))
//        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0))
//        alert.view.addConstraint(NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0))
//        self.present(alert, animated: true, completion: nil)
//    }
//
//    func backToRootVC(action: UIAlertAction) {
//
//    }
}


