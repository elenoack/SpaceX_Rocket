//
//  SettingsViewController.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 15.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK: - Views
    
    private lazy var navVC: UINavigationController = {
        let navVC = UINavigationController(rootViewController: SettingsViewController())
        navVC.title = "Настройки"
        return navVC
    }()
    
    private lazy var navigationButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Закрыть"
        return button
    }()
    
    private lazy var parrentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 14
        return stackView
    }()
    
    private lazy var verticalLabelStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var verticalSegmentedStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var heightLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var diameterLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var payloadLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var heightSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["m", "ft"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .white
        return segmentedControl
    }()
    
    private lazy var diameterSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["m", "ft"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .white
        return segmentedControl
    }()
    
    private lazy var weightSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["kg", "lb"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .white
        return segmentedControl
    }()
    
    private lazy var payloadSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["kg", "lb"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .white
        return segmentedControl
    }()
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Settings

    private func setupHierarchy() {
        view.addSubview(parrentStackView)
        
        parrentStackView.addArrangedSubview(verticalLabelStackView)
        parrentStackView.addArrangedSubview(verticalSegmentedStackView)
        
        verticalLabelStackView.addArrangedSubview(heightLabel)
        verticalLabelStackView.addArrangedSubview(diameterLabel)
        verticalLabelStackView.addArrangedSubview(weightLabel)
        verticalLabelStackView.addArrangedSubview(payloadLabel)
        
        verticalSegmentedStackView.addArrangedSubview(heightSegmentedControl)
        verticalSegmentedStackView.addArrangedSubview(diameterSegmentedControl)
        verticalSegmentedStackView.addArrangedSubview(weightSegmentedControl)
        verticalSegmentedStackView.addArrangedSubview(payloadSegmentedControl)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            parrentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            parrentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            parrentStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
        ])
    }
    
    
}
