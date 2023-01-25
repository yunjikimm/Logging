//
//  HomeTableViewCell.swift
//  Logging
//
//  Created by yunjikim on 2023/01/26.
//

import Foundation
import UIKit

class BaseCell: UITableViewCell {
    
//    @IBOutlet var titleLabel: UILabel!
//    @IBOutlet var contentLabel: UILabel!
//    var createdAtLabel: Date!
//    var updatedAtLabel: Date?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    func setUpCell() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class LogTableViewCell: BaseCell {
    
    var content: Content? {
        didSet {
            titleLabel.text = content?.title
            contentLabel.text = content?.content
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "title"
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        return label
    }()
    
    let contentLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "title"
        label.numberOfLines = 0
        return label
    }()
    
    let createdAtLabel: Date = Date()
    
    override func setUpCell() {
        
    }
    
}
