//
//  WelcomeScreenVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/18/21.
//

import UIKit

class WelcomeScreenVC: UIViewController {
    
    
    // MARK: - Objects and properties
    private var uiElements = UIElements()
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        configureNavBar()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        
        uiElements.playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        uiElements.editButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Button method
    @objc func playButtonPressed() {
        
        let vc = CategoryVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func settingButtonPressed() {
        
        let rootVC = SettingsVC()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .automatic
        present(navVC, animated: true)
    }
}
// MARK: - Constraints
extension WelcomeScreenVC {
    func addConstraints() {
        view.addSubview(uiElements.backgroundImageview)
        view.addSubview(uiElements.playButton)
        view.addSubview(uiElements.editButton)
        view.addSubview(uiElements.logoImage)

        var constraints = [NSLayoutConstraint]()
        
        let layout = view.layoutMarginsGuide
        
        // Background image:
        constraints.append(uiElements.backgroundImageview.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(uiElements.backgroundImageview.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(uiElements.backgroundImageview.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(uiElements.backgroundImageview.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        // Play Button:
        constraints.append(uiElements.playButton.centerXAnchor.constraint(equalTo: layout.centerXAnchor))
        constraints.append(uiElements.playButton.bottomAnchor.constraint(equalTo: layout.bottomAnchor))
        
        // Settings Button:
        constraints.append(uiElements.editButton.topAnchor.constraint(equalTo: layout.topAnchor))
        constraints.append(uiElements.editButton.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
  
        // Logo image:
        constraints.append(uiElements.logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(uiElements.logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - UI Configuration
extension WelcomeScreenVC {
    func configureNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
