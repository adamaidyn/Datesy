//
//  WelcomeScreenVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/18/21.
//

import UIKit
import Lottie

class WelcomeScreenVC: UIViewController {
    
    
    // MARK: - Objects and properties
    private var uiElements = UIElements()

    private let animationView: AnimationView = {
        let animationView = AnimationView()
        animationView.animation = Animation.named("LatestHeartLoading")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1.5
        animationView.loopMode = .playOnce
        return animationView
    }()
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        configureNavBar()
        configureBarButton()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        
        uiElements.playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        uiElements.editButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
        
        uiElements.logoImage.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.5, animations: {
            self.uiElements.logoImage.alpha = 1.0

        })
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
        
        // logo image
        constraints.append(uiElements.logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(uiElements.logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        
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
    
    func configureBarButton() {
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.circle", withConfiguration: config),
            style: .done,
            target: self,
            action: #selector(settingButtonPressed)
        )
        
        
        
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: UIImage(named: "gearLoveApp"),
//            style: .plain,
//            target: self,
//            action: #selector(settingButtonPressed)
//        )
        
        
    }

}
