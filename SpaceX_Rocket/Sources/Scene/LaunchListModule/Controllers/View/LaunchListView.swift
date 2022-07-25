//
//  LaunchListView.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 22.07.22.
//

import UIKit

class LaunchListView: UIView {
    // MARK: - Properties
    
    weak var viewController: LaunchListViewController?
    
    //MARK: - Views
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LaunchListCell.self, forCellReuseIdentifier: LaunchListCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
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
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
