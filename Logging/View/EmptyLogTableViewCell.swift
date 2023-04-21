//
//  EmptyLogTableViewCell.swift
//  Logging
//
//  Created by yunjikim on 2023/02/22.
//

import Foundation
import UIKit

class EmptyLogTableViewCell: UIView {
    
    // MARK: component
    let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = EMPTYTABLE.EMPTY
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpView
    func setUpView() {
        addSubview(emptyLabel)
        
        NSLayoutConstraint.activate([
            emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
