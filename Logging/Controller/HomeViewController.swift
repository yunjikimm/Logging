//
//  HomeViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import UIKit
import JJFloatingActionButton
import Alamofire

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
    
    let contentArray: [Content] = [
        Content(title: "What is Lorem Ipsum? What is Lorem Ipsum?", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        Content(title: "Where does it come from?", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        Content(title: "Why do we use it?", content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,"),
        Content(title: "Where can I get some?", content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable."),
    ]
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        tableConfigure()
        buttonConfigure()
        goToWriteEditor()
        
        
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
            let viewController = WriteContentViewController()
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    // MARK: sendToModifyEditor
    
}
