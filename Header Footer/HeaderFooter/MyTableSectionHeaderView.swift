//
//  MyTableSectionHeaderView.swift
//  HeaderFooter
//
//  Created by Arpan Bhowmik on 12/1/23.
//

import UIKit

class MyTableSectionHeaderView: UIView {
    static let identifier = "MyTableSectionHeaderView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "test"
        label.backgroundColor = .systemTeal
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        label.text = text
    }
}
