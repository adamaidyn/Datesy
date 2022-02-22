//
//  CategoryVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/20/21.
//

import UIKit

class CategoryVC: UIViewController {
    
    // MARK: - Objects and properties
    private var uiElements = UIElements()
    
    private let tableView = UIElements().categoryTableView
    
    private let questions = Questions()
    
    private let generator = UIImpactFeedbackGenerator(style: .medium)
    private let generators = UINotificationFeedbackGenerator()
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CategoryCell.self, forCellReuseIdentifier: K.cellName)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .none
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        configureNavItems()
        addConstraints()
        
        if isCurrentUser() == false {
            generators.notificationOccurred(.warning)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                UserDefaults.standard.set(true, forKey: K.userDefaultsKeys.newUserID)
                
                self.presentTutorialVC()
            }
        }
    }
    
    @objc func tutorialScreen() {
        presentTutorialVC()
    }
    
    @objc func settingButtonPressed() {
        
        let rootVC = SettingsVC()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .automatic
        present(navVC, animated: true)
    }
    
    func isCurrentUser() -> Bool {
        let newUserID = UserDefaults.standard.bool(forKey: K.userDefaultsKeys.newUserID)
        
        if newUserID == true {
            return true
        } else {
            return false
        }
    }
    
    func presentTutorialVC() {
        let rootVC = Tutorial2VC(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,
            options: nil
        )
        
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .automatic
        present(navVC, animated: true)
    }
}

// MARK: - TableView Delegate and DataSource
extension CategoryVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellName, for: indexPath) as! CategoryCell
        cell.titleLabel.text = questions.categories[indexPath.row]
        cell.descriptionLabel.text = K.descriptions[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        cell.contentView.layer.masksToBounds = true
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        presentGameplayVC(indexPath: indexPath)
        
    }
    
    func presentGameplayVC(indexPath: IndexPath) {
        let rootVC = GameplayVC()
        
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        
        rootVC.hidesBottomBarWhenPushed = true
        rootVC.modalPresentationCapturesStatusBarAppearance = true
        rootVC.currentCategory = questions.categories[indexPath.row]
        
        present(navVC, animated: true)
    }
}

// MARK: - Constraints
extension CategoryVC {
    private func addConstraints() {
        
        view.addSubview(uiElements.backgroundImageview)
        view.addSubview(tableView)
        
        var constraints = [NSLayoutConstraint]()
        
        let layout = view.layoutMarginsGuide
        
        // Background image:
        constraints.append(uiElements.backgroundImageview.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(uiElements.backgroundImageview.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(uiElements.backgroundImageview.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(uiElements.backgroundImageview.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        // tableView
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: layout.topAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: layout.bottomAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - Navigation controller configs
extension CategoryVC {
    private func configureNavItems() {
        navigationItem.title = K.categoryScreenTitle
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: K.Colours.whitePastelColor]
        
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: K.SymbolNames.infoCircle, withConfiguration: config),
            style: .done,
            target: self,
            action: #selector(tutorialScreen)
        )
    }
}
