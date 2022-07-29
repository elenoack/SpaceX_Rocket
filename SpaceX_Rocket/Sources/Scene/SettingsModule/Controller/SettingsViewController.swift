//
//  SettingsViewController.swift
//  SpaceX_Rocket
//
//  Created by Даниил Смирнов on 15.06.2022.
//

import UIKit


class SettingsViewController: UIViewController {
    // MARK: - Properties
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    var presenter: SettingsPresenterProtocol?
    private let defaults = UserDefaultsStorage()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
        setupavigationController()
        presenter?.downloadSettings()
    }
    
    //MARK: - Settings
    
    private func setupView() {
        view = SettingsView()
        view.backgroundColor = .black
        isModalInPresentation = true
    }
    
    func setupActions() {
        settingsView?.heightSegmentedControl.addTarget(nil, action: #selector(segmentDidChange(_:)), for: .valueChanged)
        settingsView?.diameterSegmentedControl.addTarget(nil, action: #selector(segmentDidChange(_:)), for: .valueChanged)
        settingsView?.massSegmentedControl.addTarget(nil, action: #selector(segmentDidChange(_:)), for: .valueChanged)
        settingsView?.payloadSegmentedControl.addTarget(nil, action: #selector(segmentDidChange(_:)), for: .valueChanged)
    }

    private func setupavigationController() {
        let closeButton = UIBarButtonItem(title: Strings.navigationButtonTitle, style: .plain, target: self, action: #selector(back))
        closeButton.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 19),
            NSAttributedString.Key.foregroundColor : UIColor.white,
        ], for: .normal)
        self.navigationItem.rightBarButtonItem = closeButton
    }
}

// MARK: - Actions

extension SettingsViewController {
    
    @objc
    func back()  {
        self.presenter?.tapBackButton(viewController: self)
    }
    
    @objc
    private func segmentDidChange(_ sender: UISegmentedControl) {
        presenter?.saveSettings()
    }
}

// MARK: - Private

extension SettingsViewController: SettingsViewProtocol  {
    
    internal func download() {
        settingsView?.heightSegmentedControl.selectedSegmentIndex = defaults.unitsHeight
        settingsView?.diameterSegmentedControl.selectedSegmentIndex = defaults.unitsDiameter
        settingsView?.massSegmentedControl.selectedSegmentIndex = defaults.unitsMass
        settingsView?.payloadSegmentedControl.selectedSegmentIndex = defaults.unitsPayload
    }
    
    func save() {
        defaults.unitsHeight = settingsView?.heightSegmentedControl.selectedSegmentIndex ?? 0
        defaults.unitsDiameter = settingsView?.diameterSegmentedControl.selectedSegmentIndex ?? 0
        defaults.unitsMass = settingsView?.massSegmentedControl.selectedSegmentIndex ?? 0
        defaults.unitsPayload = settingsView?.payloadSegmentedControl.selectedSegmentIndex ?? 0
    }
}

// MARK: - Constants

extension SettingsViewController {
    
    enum Strings {
        static let navigationButtonTitle: String = "Закрыть"
    }
}

  
