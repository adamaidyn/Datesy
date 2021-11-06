//
//  CategoryCell.swift
//  iLoveYouApp
//
//  Created by Adm Aidyn on 10/20/21.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = K.Colours.whitePastelColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    let goImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: K.AssetsNames.goButton)
        imageView.contentMode = .scaleAspectFill
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setConstraints() {
        addSubview(backView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(goImage)
        
        var constraints = [NSLayoutConstraint]()
        
        // Background view
        constraints.append(backView.leadingAnchor.constraint(equalTo: leadingAnchor))
        constraints.append(backView.trailingAnchor.constraint(equalTo: trailingAnchor))
        constraints.append(backView.topAnchor.constraint(equalTo: topAnchor, constant: 5))
        constraints.append(backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5))
        
        // Title:
        constraints.append(titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10))
        constraints.append(titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16))
        
        // Description
        constraints.append(descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16))
        constraints.append(descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 35))
        constraints.append(descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100))
        
        // "GO" Image
        constraints.append(goImage.centerYAnchor.constraint(equalTo: centerYAnchor))
        constraints.append(goImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16))
        
        NSLayoutConstraint.activate(constraints)
    }
}
