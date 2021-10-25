//
//  UIElements.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/18/21.
//

import UIKit

struct BasicUIElements {
    
    // MARK: - Basic Elements
    let backgroundImageview: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: K.assetsNames.pinkBackground)
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let playButton: UIButton = {
        let pinkColor = UIColor(red: 0.97, green: 0.46, blue: 0.67, alpha: 1.00)
        let whitePastelColor = UIColor(red: 0.96, green: 0.98, blue: 0.98, alpha: 1.00)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: K.assetsNames.playButton), for: .normal)
        return button
    }()
    
    let settingsButton: UIButton = {
        let pinkColor = UIColor(red: 0.97, green: 0.46, blue: 0.67, alpha: 1.00)
        let whitePastelColor = UIColor(red: 0.96, green: 0.98, blue: 0.98, alpha: 1.00)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: K.assetsNames.settingsButton), for: .normal)
        return button
    }()
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: K.assetsNames.appLogo)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    // MARK: - TableView elements
    
    let categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
}
