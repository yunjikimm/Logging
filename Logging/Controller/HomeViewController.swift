//
//  HomeViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import UIKit
import JJFloatingActionButton
//import Alamofire

class HomeViewController: UITableViewController {
    
    // MARK: components
    let logTableView: UITableView! = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    let writeContentActionButton = JJFloatingActionButton()
    let contentDataService = ContentDataService()
    var contents = [Content]()
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        tableConfigure()
        buttonConfigure()
        goToWriteEditor()
        getAllContent()
    }
    
    // MARK: set attribute
    private func setAttribute() {
        logTableView.register(LogTableViewCell.self, forCellReuseIdentifier: LogTableViewCell.tableViewCellID)
        logTableView.register(LogTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: LogTableViewHeaderView.headerViewID)
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0.0
        }
        tableView.contentInsetAdjustmentBehavior = .never
        
        logTableView.delegate = self
        logTableView.dataSource = self
    }
    
    // MARK: tableConfigure
    private func tableConfigure() {
        view.backgroundColor = .systemBackground
        view.addSubview(logTableView)
        
        NSLayoutConstraint.activate([
            logTableView.topAnchor.constraint(equalTo: view.topAnchor),
            logTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: buttonConfigure - JJFloatingActionButton
    private func buttonConfigure() {
        view.addSubview(writeContentActionButton)
        
        writeContentActionButton.buttonColor = .black
        
        writeContentActionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            writeContentActionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            writeContentActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: goToWriteEditor - JJFloatingActionButton
    private func goToWriteEditor() {
        writeContentActionButton.addItem(title: "", image: nil) { item in
            self.present(VIEWCONTROLLER.WRITE, animated: true, completion: nil)
        }
    }
    
    // MARK: getAllContent - Alamofire
    private func getAllContent() {
        contentDataService.getAllContent { response in
            switch response {
            case .success(let data):
                for item in data.contentsData {
                    self.contents.append(Content(id: item.id, title: item.title, content: item.content, createdAt: item.createdAt, updatedAt: item.updatedAt))
                }
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
