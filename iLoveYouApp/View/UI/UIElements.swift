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
        imageView.image = UIImage(named: "PurpleBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.accessibilityLabel = "App logo"
        return imageView
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: K.AssetsNames.playButtonPurple), for: .normal)
        button.accessibilityLabel = "Play"
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
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "The best questions to fall in love"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.numberOfLines = 0
        label.textColor = K.Colours.whitePastelColor
        return label
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
        
        let justConfig = UIImage.SymbolConfiguration(pointSize: UIScreen.main.bounds.height / 13, weight: .bold, scale: .large)
        
        let largeBoldDoc = UIImage(systemName: K.SymbolNames.nextSymbol, withConfiguration: justConfig)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(largeBoldDoc, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = UIScreen.main.bounds.height / 16.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5
        button.accessibilityLabel = "Next question"
        
        if #available(iOS 13, *) {
            button.setImage(UIImage(systemName: "arrow.right.circle", withConfiguration: justConfig), for: .normal)
        }
        return button
    }()
    
    var questionText: CopyableLabel = {

        let label = CopyableLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = K.Colours.pureBlack
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
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
    
    // MARK: - Tutorial Screen UI
    let illustImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let tutorialLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: UIScreen.main.bounds.height / 28.13333333333333, weight: .light)
        label.textColor = K.Colours.pureBlack
        return label
    }()
    
    let skipDoneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityLabel = "Skip"
        button.setTitleColor(.systemGray, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        return button
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
        case iPhoneXR_11 = "iPhone XR or iPhone 11"
        case iPhoneXSMax_11ProMax = "iPhone XS Max or iPhone 11 Pro Max"
        case iPhone12Mini_13Mini = "iPhone 12 Mini or iPhone 13 Mini"
        case iPhone12_12Pro_13_13Pro = "iPhone 12, iPhone 12 Pro, iPhone 13, iPhone 13 Pro"
        case iPhone12ProMax_iPhone13ProMax = "iPhone 12 Pro Max or iPhone 13 Pro Max"
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
        case 1792:
            return .iPhoneXR_11
        case 2340:
            return .iPhone12Mini_13Mini
        case 2532:
            return .iPhone12_12Pro_13_13Pro
        case 2688:
            return .iPhoneXSMax_11ProMax
        case 2778:
            return .iPhone12ProMax_iPhone13ProMax
        default:
            return .unknown
        }
    }
}
extension UIImage {
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
