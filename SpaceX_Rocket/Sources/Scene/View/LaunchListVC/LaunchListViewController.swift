//
//  LaunchListViewController.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 16.06.2022.
//

import UIKit

class LaunchListViewController: UIViewController {
    
    //MARK: - Views
    let rockets = ["FalconSat", "Heavy Holidays", "CRS-24 Mission"]
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LaunchListCell.self, forCellReuseIdentifier: LaunchListCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHieararchy()
        setupLayout()
    }
    
    //MARK: - Settings
    private func setupHieararchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension LaunchListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        rockets.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchListCell.reuseId, for: indexPath) as? LaunchListCell else { return UITableViewCell()}
        
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
