//
//  HomeViewExtension.swift
//  Logging
//
//  Created by yunjikim on 2023/02/13.
//

import Foundation
import UIKit

extension HomeViewController {
    
    // MARK: extension - table cell
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
    
    // MARK: extension - tableview header view
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
