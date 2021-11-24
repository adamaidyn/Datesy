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
        view.layer.cornerRadius = 22
        return view
    }()
    
    private let goImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: K.AssetsNames.goButton)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: K.AssetsNames.visbyRound, size: 25)
        label.textColor = K.Colours.pinkColor
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = label.font.withSize(17)
        return label
    }()
    
    
    // MARK: - Cell life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        configureDiscriptionLabel()
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
        constraints.append(titleLabel.leadingAnchor.constraint(equalTo: backViewLayout.leadingAnchor, constant: 5))
        constraints.append(titleLabel.topAnchor.constraint(equalTo: backViewLayout.topAnchor))
        
        // Description
        constraints.append(descriptionLabel.leadingAnchor.constraint(equalTo: backViewLayout.leadingAnchor, constant: 5))
        constraints.append(descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100))
        constraints.append(descriptionLabel.topAnchor.constraint(equalTo: backViewLayout.topAnchor, constant: 35))
        
        // "GO" Image
        constraints.append(goImage.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -5))
        constraints.append(goImage.centerYAnchor.constraint(equalTo: centerYAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Elements config
    
    func configureDiscriptionLabel() {
        let deviceType = UIDevice.current.deviceType
        
        switch deviceType {
        
        case .iPhone4_4S:
            descriptionLabel.font = UIFont.systemFont(ofSize: 12)
            
        case .iPhones_5_5s_5c_SE:
            descriptionLabel.font = UIFont.systemFont(ofSize: 14)
            
        case .iPhones_6_6s_7_8:
            descriptionLabel.font = UIFont.systemFont(ofSize: 17)
            
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            descriptionLabel.font = UIFont.systemFont(ofSize: 17)
            
        case .iPhoneX:
            descriptionLabel.font = UIFont.systemFont(ofSize: 17)
            
        default:
            descriptionLabel.font = UIFont.systemFont(ofSize: 17)
        }
    }
}



