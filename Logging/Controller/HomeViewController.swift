//
//  ViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import UIKit

class HomeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: system background
        self.view.backgroundColor = .systemBackground
        
        // MARK: logo
        let logoNameLabel = UILabel()
        logoNameLabel.text = "Logging"
        logoNameLabel.font = .boldSystemFont(ofSize: 32)

        self.view.addSubview(logoNameLabel)
        logoNameLabel.translatesAutoresizingMaskIntoConstraints = false

        logoNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        logoNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        
        // MARK: list table view
        
        // MARK: button to add cell
    }

}
