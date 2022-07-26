//
//  LaunchListViewController.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 16.06.2022.
//

import UIKit

class LaunchListViewController: UIViewController, LaunchViewProtocol {
    func success() {
        launchListView?.tableView.reloadData()
    }
    
    func failure(error: Error) {
        //тут что то будет типа алерта
    }
    
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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: #selector (back))
    }
}

//MARK: - UITableViewDataSource
extension LaunchListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.launches?.count ?? 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchListCell.reuseId, for: indexPath) as? LaunchListCell else { return LaunchListCell()}
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        guard let rows = presenter?.launches else { return cell}
        let row = rows[indexPath.section]
        cell.dateLabel.text = row.dateFlightToSpace
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
