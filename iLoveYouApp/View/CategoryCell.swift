//
//  CategoryCell.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/20/21.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    // MARK: - Cell UI elements
    private let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = K.Colours.whitePastelColor
        view.clipsToBounds = true
        view.layer.cornerRadius = UIScreen.main.bounds.width / 20
        return view
    }()
    
    private let goImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: K.AssetsNames.goButtonPurple)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = K.Colours.specialPurple
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: - Cell life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        configureDiscriptionLabel(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Constraints
    func setConstraints() {
        addSubview(backView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(goImage)
        
        var constraints = [NSLayoutConstraint]()
        
        let layout = layoutMarginsGuide
        
        let backViewLayout = backView.layoutMarginsGuide
        
        // Background view
        constraints.append(backView.leadingAnchor.constraint(equalTo: layout.leadingAnchor))
        constraints.append(backView.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        constraints.append(backView.topAnchor.constraint(equalTo: topAnchor, constant: 5))
        constraints.append(backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5))
        
        // Title:
        constraints.append(titleLabel.leadingAnchor.constraint(equalTo: backViewLayout.leadingAnchor))
        constraints.append(titleLabel.topAnchor.constraint(equalTo: backViewLayout.topAnchor))
        
        // Description
        constraints.append(descriptionLabel.leadingAnchor.constraint(equalTo: backViewLayout.leadingAnchor))
        constraints.append(descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100))
//        constraints.append(descriptionLabel.topAnchor.constraint(equalTo: backViewLayout.topAnchor, constant: 35))
        constraints.append(descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor))
        
        // "GO" Image
        constraints.append(goImage.trailingAnchor.constraint(equalTo: layout.trailingAnchor))
        constraints.append(goImage.centerYAnchor.constraint(equalTo: centerYAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Elements config
    
    func configureDiscriptionLabel(_ label: UILabel) {
        let deviceType = UIDevice.current.deviceType
        switch deviceType {
        case .iPhone4_4S:
            label.font = UIFont.systemFont(ofSize: 12)
        case .iPhones_5_5s_5c_SE:
            label.font = UIFont.systemFont(ofSize: 14)
        case .iPhones_6_6s_7_8:
            label.font = UIFont.systemFont(ofSize: 15.5)
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            label.font = UIFont.systemFont(ofSize: 19)
        case .iPhoneX:
            label.font = UIFont.systemFont(ofSize: 16)
        case .iPhoneXR_11:
            label.font = UIFont.systemFont(ofSize: 16)
        case .iPhone12Mini_13Mini:
            label.font = UIFont.systemFont(ofSize: 15.5)
        case .iPhone12_12Pro_13_13Pro:
            label.font = UIFont.systemFont(ofSize: 16)
        case .iPhoneXSMax_11ProMax:
            label.font = UIFont.systemFont(ofSize: 19)
        case .iPhone12ProMax_iPhone13ProMax:
            label.font = UIFont.systemFont(ofSize: 19)
        default:
            label.font = UIFont.systemFont(ofSize: 19)
        }
    }
}



