//
//  CategoryVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/20/21.
//

import UIKit

class CategoryVC: UIViewController {
    
    private var uiElements = UIElements()
    
    private let tableView = UIElements().categoryTableView
    
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
        
        navigationItem.title = K.categoryScreenTitle
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: K.Colours.whitePastelColor]
        
        addConstraints()
    }
}

// MARK: - TableView Delegate
extension CategoryVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return K.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellName, for: indexPath) as! CategoryCell
        cell.titleLabel.text = K.categories[indexPath.row]
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
        
        let rootVC = GameplayVC()
        
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen

        rootVC.hidesBottomBarWhenPushed = true
        rootVC.modalPresentationCapturesStatusBarAppearance = true
        rootVC.currentCategory = K.categories[indexPath.row]
        
        present(navVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
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
        constraints.append(tableView.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}


