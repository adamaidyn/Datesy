//
//  UIElements.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/18/21.
//

import UIKit

struct UIElements {
    
    // MARK: - Universal UI Elements
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
    
    let editButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: UIScreen.main.bounds.height / 24,
                                                      weight: .bold,
                                                      scale: .large)
        let largeBoldDoc = UIImage(systemName: K.SymbolNames.sliderHorizontal, withConfiguration: largeConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: K.AssetsNames.settingsButton), for: .normal)
        button.setImage(largeBoldDoc, for: .normal)
        button.tintColor = K.Colours.whitePastelColor
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
    
    let questionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: K.AssetsNames.visbyRound, size: 28)
        label.textColor = K.Colours.pureBlack
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: - Settings Screen UI
    
    let settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let creditsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
// MARK: - extensions
extension UIDevice {
    
    enum DeviceType: String {
        case iPhone4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhoneX = "iPhone X"
        case unknown = "iPadOrUnknown"
    }
    
    var deviceType: DeviceType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhoneX
        default:
            return .unknown
        }
    }
}
