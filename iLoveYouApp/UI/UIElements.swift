//
//  UIElements.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/18/21.
//

import UIKit

struct UIElements {
    
    // MARK: - Basic Elements
    let backgroundImageview: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: K.AssetsNames.pinkBackground)
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: K.AssetsNames.playButton), for: .normal)
        return button
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: K.AssetsNames.settingsButton), for: .normal)
        return button
    }()
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: K.AssetsNames.appLogo)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    // MARK: - TableView elements
    let categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    // MARK: - Gameplay elements
    let questionWindow: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.backgroundColor = K.Colours.whitePastelColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        return view
    }()
    
    let shareButton: UIButton = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: UIScreen.main.bounds.height / 19, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: K.SymbolNames.shareSymbol, withConfiguration: largeConfig)

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(largeBoldDoc, for: .normal)
        button.tintColor = K.Colours.whitePastelColor
        return button
    }()
        
    let nextButton: UIButton = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: UIScreen.main.bounds.height / 13, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: K.SymbolNames.nextSymbol, withConfiguration: largeConfig)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(largeBoldDoc, for: .normal)
        button.tintColor = K.Colours.pinkColor
        button.backgroundColor = K.Colours.whitePastelColor
        button.layer.cornerRadius = UIScreen.main.bounds.height / 18
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5
        return button
    }()
    
    let exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: K.AssetsNames.exitButton), for: .normal)
        return button
    }()
    
    let questionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: K.AssetsNames.visbyRound, size: UIScreen.main.bounds.height / 28)
        label.textColor = K.Colours.pureBlack
        label.numberOfLines = 0
        return label
    }()
}
