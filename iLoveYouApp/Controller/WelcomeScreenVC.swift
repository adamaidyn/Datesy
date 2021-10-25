//
//  WelcomeScreenVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/18/21.
//

import UIKit

class WelcomeScreenVC: UIViewController {
    
    var basicUIElements = BasicUIElements()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        
        basicUIElements.playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        
        title = "Home"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
    }
    
    @objc func playButtonPressed() {
        
        let vc = CategoryVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension WelcomeScreenVC {
    func addConstraints() {
        view.addSubview(basicUIElements.backgroundImageview)
        view.addSubview(basicUIElements.playButton)
        view.addSubview(basicUIElements.settingsButton)
        view.addSubview(basicUIElements.logoImage)

        var constraints = [NSLayoutConstraint]()
        
        let layout = view.layoutMarginsGuide
        
        // Background image:
        constraints.append(basicUIElements.backgroundImageview.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(basicUIElements.backgroundImageview.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(basicUIElements.backgroundImageview.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(basicUIElements.backgroundImageview.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        // Play Button:
//        constraints.append(basicUIElements.playButton.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
//        constraints.append(basicUIElements.playButton.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        constraints.append(basicUIElements.playButton.centerXAnchor.constraint(equalTo: layout.centerXAnchor))
        
        constraints.append(basicUIElements.playButton.bottomAnchor.constraint(equalTo: layout.bottomAnchor))
        
        // Settings Button:
        constraints.append(basicUIElements.settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 44))
        constraints.append(basicUIElements.settingsButton.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
  
        // Logo image:
        constraints.append(basicUIElements.logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(basicUIElements.logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}
