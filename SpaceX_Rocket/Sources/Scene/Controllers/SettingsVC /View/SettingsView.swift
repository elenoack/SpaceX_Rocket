//
//  SettingsView.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 22.07.22.
//

import UIKit

class SettingsView: UIView {
  // MARK: - Properties
  
  weak var viewController: SettingsViewController?

  //MARK: - Views

    private lazy var navVC: UINavigationController = {
        let navVC = UINavigationController(rootViewController: SettingsViewController())
        navVC.title = Strings.navVCTitle
        return navVC
    }()
    
    lazy var navigationButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = Strings.navigationButtonTitle
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
        label.text = Strings.heightLabelTitle
        return label
    }()
    
    private lazy var diameterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.text = Strings.diameterLabelTitle
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.text = Strings.weightLabelTitle
        return label
    }()
    
    private lazy var payloadLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.text = Strings.payloadLabelTitle
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var heightSegmentedControl: UISegmentedControl = {
        let segmentedItems = [Strings.mass, Strings.ft]
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
        let segmentedItems = [Strings.mass, Strings.ft]
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
        let segmentedItems = [Strings.kg, Strings.lb]
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
        let segmentedItems = [Strings.kg, Strings.lb]
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let font = UIFont.systemFont(ofSize: 17)
        let selectedAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.black]
        let normalAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectedAttribute, for: .selected)
        segmentedControl.setTitleTextAttributes(normalAttribute, for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
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
        addSubview(parrentStackView)
        
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
            parrentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.parrentStackIndent),
            parrentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.parrentStackIndent),
            parrentStackView.topAnchor.constraint(equalTo: topAnchor, constant: Metric.parrentStackTopIndent),
            parrentStackView.heightAnchor.constraint(equalToConstant: Metric.parrentStackHeight)
        ])
    }
}

// MARK: - Constants
extension SettingsView {
    
    enum Metric {
        static let parrentStackTopIndent: CGFloat = 150
        static let parrentStackHeight: CGFloat = 250
        static let parrentStackIndent: CGFloat = 16
        static let parrentStackSpacing: CGFloat = 20
        static let stackSpacing: CGFloat = 72
    }
    
    enum Strings {
        static let navVCTitle: String = "Настройки"
        static let navigationButtonTitle: String = "Закрыть"
        static let heightLabelTitle: String = "Высота"
        static let diameterLabelTitle: String = "Диаметр"
        static let weightLabelTitle: String = "Масса"
        static let payloadLabelTitle: String = "Нагрузка"
        static let mass: String = "m"
        static let ft: String = "ft"
        static let kg: String = "kg"
        static let lb: String = "lb"
    }
}
