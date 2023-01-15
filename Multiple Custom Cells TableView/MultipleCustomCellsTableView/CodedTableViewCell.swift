//
//  CodedTableViewCell.swift
//  MultipleCustomCellsTableView
//
//  Created by Arpan Bhowmik on 12/1/23.
//

import UIKit

class CodedTableViewCell: UITableViewCell {
    static let identifier = "CodedTableViewCell"
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 100
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    func configure() {
        myLabel.text = "It works"
        myImageView.image = UIImage(named: "arpan")
        
        stackView.addArrangedSubview(myImageView)
        stackView.addArrangedSubview(myLabel)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            myImageView.widthAnchor.constraint(equalToConstant: 200),
            myImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
//        myLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        myImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
                
//        contentView.addSubview(myLabel)
//        contentView.addSubview(myImageView)
//
//        NSLayoutConstraint.activate([
//            myLabel.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor),
//            trailingAnchor.constraint(equalTo: myLabel.trailingAnchor, constant: 10),
//
//            myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            myImageView.widthAnchor.constraint(equalToConstant: 200),
//            myImageView.heightAnchor.constraint(equalToConstant: 200)
//        ])
    }
}
