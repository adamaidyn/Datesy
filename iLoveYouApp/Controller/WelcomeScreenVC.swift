//
//  WelcomeScreenVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/18/21.
//

import UIKit

class WelcomeScreenVC: UIViewController {
    
    private var uiElements = UIElements()
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavBar()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        
        uiElements.playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        
    }
    @objc func playButtonPressed() {
        
        let vc = CategoryVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension WelcomeScreenVC {
    func addConstraints() {
        view.addSubview(uiElements.backgroundImageview)
        view.addSubview(uiElements.playButton)
        view.addSubview(uiElements.settingsButton)
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
        constraints.append(uiElements.settingsButton.topAnchor.constraint(equalTo: layout.topAnchor))
        constraints.append(uiElements.settingsButton.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
  
        // Logo image:
        constraints.append(uiElements.logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(uiElements.logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}
extension WelcomeScreenVC {
    func configureNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
