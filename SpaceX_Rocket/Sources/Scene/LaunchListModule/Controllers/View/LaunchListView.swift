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
        tableView.register(LaunchListCell.self, forCellReuseIdentifier: LaunchListCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.color = .white
        view.hidesWhenStopped = true
        return view
    }()
    
    lazy var blackView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        return view
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
        addSubviewsForAutoLayout([tableView,
                                  blackView,
                                  activityIndicatorView])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            blackView.heightAnchor.constraint(equalTo: heightAnchor),
            blackView.widthAnchor.constraint(equalTo: widthAnchor),
            blackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            blackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

