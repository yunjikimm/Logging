//
//  LogTableViewCell.swift
//  Logging
//
//  Created by yunjikim on 2023/01/26.
//

import Foundation
import UIKit

class LogTableViewCell: UITableViewCell {
    
    static let tableViewCellID = "LogTableViewCell"
    
    // MARK: component
    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "title"
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "content"
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    // MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: configureContents
    func configureContents() {
        contentView.addSubview(cellView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            contentLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -45),
        ])
    }
    
}
