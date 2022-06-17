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
        stackView.spacing = Metric.parrentStackSpacing
        return stackView
    }()
    
    private lazy var firstHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Metric.stackSpacing
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var secontHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Metric.stackSpacing
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var thirdHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Metric.stackSpacing
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var fourthHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Metric.stackSpacing
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
        label.text = "Нагрузка"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var heightSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["m", "ft"]
        let font = UIFont.systemFont(ofSize: 17)
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let selectedAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.black]
        let normalAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectedAttribute, for: .selected)
        segmentedControl.setTitleTextAttributes(normalAttribute, for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var diameterSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["m", "ft"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let font = UIFont.systemFont(ofSize: 17)
        let selectedAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.black]
        let normalAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectedAttribute, for: .selected)
        segmentedControl.setTitleTextAttributes(normalAttribute, for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var weightSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["kg", "lb"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let font = UIFont.systemFont(ofSize: 17)
        let selectedAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.black]
        let normalAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectedAttribute, for: .selected)
        segmentedControl.setTitleTextAttributes(normalAttribute, for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var payloadSegmentedControl: UISegmentedControl = {
        let segmentedItems = ["kg", "lb"]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let font = UIFont.systemFont(ofSize: 17)
        let selectedAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.black]
        let normalAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectedAttribute, for: .selected)
        segmentedControl.setTitleTextAttributes(normalAttribute, for: .normal)
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
            parrentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.parrentStackIndent),
            parrentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metric.parrentStackIndent),
            parrentStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: Metric.parrentStackTopIndent),
            parrentStackView.heightAnchor.constraint(equalToConstant: Metric.parrentStackHeight)
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

// MARK: - Constants
extension SettingsViewController {
    
    enum Metric {
        static let parrentStackTopIndent: CGFloat = 150
        static let parrentStackHeight: CGFloat = 250
        static let parrentStackIndent: CGFloat = 16
        static let parrentStackSpacing: CGFloat = 20
        static let stackSpacing: CGFloat = 72
    }
}

