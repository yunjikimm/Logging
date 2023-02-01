//
//  HomeViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import UIKit
import JJFloatingActionButton

class HomeViewController: UITableViewController {
    
    // MARK: components
    private let logTableView: UITableView! = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()
    let addCellActionButton = JJFloatingActionButton()
    
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
        actionButton()
        buttonConfigure()
    }
    
    // MARK: attribute
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
    
    // MARK: buttonConfigure
    private func buttonConfigure() {
        view.addSubview(addCellActionButton)
        
        addCellActionButton.buttonColor = .black
        
        addCellActionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addCellActionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            addCellActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    // MARK: actionButton
    private func actionButton() {
        addCellActionButton.addItem(title: "", image: nil) { item in
            // do something
            print("addCellActionButton - called")
        }
    }

}

// MARK: extension - table cell
extension HomeViewController {
    
    // cell 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    // 각 cell에 대한 설정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell에 대한 인스턴스 생성 - dequeueReusableCell 재사용 셀
        // as! : 자료형 강제 정의
        let cell = logTableView.dequeueReusableCell(withIdentifier: LogTableViewCell.tableViewCellID, for: indexPath) as! LogTableViewCell
        
        cell.titleLabel.text = contentArray[indexPath.row].title
        cell.contentLabel.text = contentArray[indexPath.row].content
        
        cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        return cell
    }
    
    // cell 스와이프
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 수정
        let modifyCellActionButton = UIContextualAction(style: .normal, title: "수정", handler: { action, view, completionHandler in
            
            print("modifyCellActionButton - called")
            
        })
        
        // 삭제
        let deleteCellActionButton = UIContextualAction(style: .normal, title: "삭제", handler: { action, view, completionHandler in
            
            print("deleteCellActionButton - called")
            
        })
        
        // backgroundColor
        modifyCellActionButton.backgroundColor = .systemBlue
        deleteCellActionButton.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [modifyCellActionButton, deleteCellActionButton])
        
    }
    
}

// MARK: extension - tableview header view
extension HomeViewController {

    // tableview haeder view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = logTableView.dequeueReusableHeaderFooterView(withIdentifier: LogTableViewHeaderView.headerViewID) as! LogTableViewHeaderView

        headerView.logoLabel.text = LogTableViewHeaderView.logoText

        let backgroundView = UIView(frame: headerView.bounds)
        headerView.backgroundView = backgroundView

        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return LogTableViewHeaderView.tableViewInitHeight
    }

}



//#if DEBUG
//import SwiftUI
//struct HomeViewControllerRepresentable: UIViewControllerRepresentable {
//    
//func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//}
//@available(iOS 13.0.0, *)
//func makeUIViewController(context: Context) -> UIViewController{
//    HomeViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            HomeViewControllerRepresentable()
//                .ignoresSafeArea()
//                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
//        }
//        
//    }
//} #endif
