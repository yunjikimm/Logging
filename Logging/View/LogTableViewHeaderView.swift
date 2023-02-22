//
//  LogTableViewHeaderView.swift
//  Logging
//
//  Created by yunjikim on 2023/01/29.
//

import Foundation
import UIKit

class LogTableViewHeaderView: UITableViewHeaderFooterView {
    
    static let headerViewID = "LogoTableViewHeaderView"
    static let logoText = "Logging"
    static let tableViewInitHeight = 105.0
    
    // MARK: component
    let tableHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    let logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 34)
        return label
    }()
    
    // MARK: init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: setUpView
    func setUpView() {
        contentView.addSubview(tableHeaderView)
        tableHeaderView.addSubview(logoLabel)
        
        NSLayoutConstraint.activate([
            tableHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableHeaderView.heightAnchor.constraint(equalToConstant: LogTableViewHeaderView.tableViewInitHeight),
            
            logoLabel.leadingAnchor.constraint(equalTo: tableHeaderView.leadingAnchor, constant: 16),
            logoLabel.bottomAnchor.constraint(equalTo: tableHeaderView.bottomAnchor, constant: -10)
        ])
    }
}
