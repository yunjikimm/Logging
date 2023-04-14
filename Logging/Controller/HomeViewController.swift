//
//  HomeViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import UIKit
import JJFloatingActionButton
import RealmSwift

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
    var contentList = [Content]()
    
    var contentObject: Results<Content>!
    var notificationToken: NotificationToken?
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        tableConfigure()
        buttonConfigure()
        goToWriteEditor()
        readAllContent()
        
        notificationToken = contentObject.observe { (changes) in
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: set attribute
    private func setAttribute() {
        logTableView.register(LogTableViewCell.self, forCellReuseIdentifier: ID.TABLEVIEWCELL)
        logTableView.register(LogTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: ID.TABLEVIEWHEADERVIEW)
        
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
        VIEWCONTROLLER.WRITE.modalPresentationStyle = .fullScreen
    }
    
    // MARK: readAllContent - Realm Get
    func readAllContent() {
        self.contentObject = ContentDataService.shared.realm.objects(Content.self).sorted(byKeyPath: "updatedAt", ascending: false)
    }
    
    
}
