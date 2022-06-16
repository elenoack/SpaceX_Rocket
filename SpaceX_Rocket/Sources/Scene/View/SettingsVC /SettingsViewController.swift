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
        let button = UIBarButtonItem(title: "Закрыть",
                                     style: .plain,
                                     target: self,
                                     action: #selector(back))
        button.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 19),
            NSAttributedString.Key.foregroundColor : UIColor.white,
        ], for: .normal)
        return button
    }()
    
    private lazy var parrentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var firstHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 72
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var secontHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 72
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var thirdHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 72
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var fourthHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 69
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.text = "Высота"
        return label
    }()
    
    private lazy var diameterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.text = "Диаметр"
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.text = "Масса"
        return label
    }()
    
    private lazy var payloadLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.text = "Полезная нагрузка"
        return label
    }()
    
    private lazy var heightSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["m", "ft"]
        let font = UIFont.systemFont(ofSize: 16)
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let selectTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let normalTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectTitleTextAttributes, for: .selected)
        segmentedControl.setTitleTextAttributes(normalTitleTextAttributes, for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var diameterSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["m", "ft"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let selectTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let normalTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectTitleTextAttributes, for: .selected)
        segmentedControl.setTitleTextAttributes(normalTitleTextAttributes, for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var weightSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["kg", "lb"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let selectTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let normalTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectTitleTextAttributes, for: .selected)
        segmentedControl.setTitleTextAttributes(normalTitleTextAttributes, for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var payloadSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["kg", "lb"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let selectTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let normalTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectTitleTextAttributes, for: .selected)
        segmentedControl.setTitleTextAttributes(normalTitleTextAttributes, for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupHierarchy()
        setupLayout()
        setupavigationController()
    }
    
    //MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(parrentStackView)
        
        parrentStackView.addArrangedSubviewsForAutoLayout([
            firstHorizontalStackView,
            secontHorizontalStackView,
            thirdHorizontalStackView,
            fourthHorizontalStackView
        ])
        
        firstHorizontalStackView.addArrangedSubviewsForAutoLayout([
            heightLabel,
            heightSegmentedControl,
        ])
        
        secontHorizontalStackView.addArrangedSubviewsForAutoLayout([
            diameterLabel,
            diameterSegmentedControl,
        ])
        
        thirdHorizontalStackView.addArrangedSubviewsForAutoLayout([
            weightLabel,
            weightSegmentedControl,
        ])
        
        fourthHorizontalStackView.addArrangedSubviewsForAutoLayout([
            payloadLabel,
            payloadSegmentedControl,
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            parrentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            parrentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            parrentStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            parrentStackView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupavigationController() {
        self.navigationItem.rightBarButtonItem = navigationButton
    }
}

// MARK: - Actions
extension SettingsViewController {
    
    @objc
    func back()  {
        dismiss(animated: true)
    }
}
