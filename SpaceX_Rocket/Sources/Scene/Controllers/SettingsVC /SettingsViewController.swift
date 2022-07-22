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
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupavigationController()
    }
    
    //MARK: - Settings
    
    private func setupView() {
        view = SettingsView()
        view.backgroundColor = .black
    }
    
    private func setupavigationController() {
        self.navigationItem.rightBarButtonItem =  settingsView?.navigationButton
//        UIBarButtonItem(title: Strings.navVCTitle, style: .plain, target: nil, action: #selector (back)) 
        // переделать
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
    
    enum Strings {
        static let navVCTitle: String = "Настройки"
    }
}
