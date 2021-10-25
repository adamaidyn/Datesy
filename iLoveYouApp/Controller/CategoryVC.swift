//
//  CategoryVC.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/20/21.
//

import UIKit

class CategoryVC: UIViewController {

    var basicUIElements = BasicUIElements()
    
    let tableView = BasicUIElements().categoryTableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CategoryCell.self, forCellReuseIdentifier: K.cellName)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .none
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        navigationItem.title = K.categoryScreenTitle
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        addConstraints()
    }
}
extension CategoryVC {
    func addConstraints() {
        
        view.addSubview(basicUIElements.backgroundImageview)
        view.addSubview(tableView)
        
        var constraints = [NSLayoutConstraint]()
        
        let layout = view.layoutMarginsGuide
        
        // Background image:
        constraints.append(basicUIElements.backgroundImageview.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(basicUIElements.backgroundImageview.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(basicUIElements.backgroundImageview.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(basicUIElements.backgroundImageview.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        // tableView
        constraints.append(tableView.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor))

        
        NSLayoutConstraint.activate(constraints)
    }
}
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
}
